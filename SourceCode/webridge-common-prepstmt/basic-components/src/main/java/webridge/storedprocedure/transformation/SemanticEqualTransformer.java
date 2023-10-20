package webridge.storedprocedure.transformation;

import webridge.exception.NotImplementedException;
import webridge.sql.types.SQLVarType;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SemanticEqualTransformer {

  public static final String DECIMAL_FUNC_NAME = "c_decimal";
  public static final String GET_INT_COMPACT_FUNC = "get_int_compact";
  public static final String GET_SCALE_FUNC = "get_scale";
  public static final String CURRENT_TIME_FUNC = "NOW(3)";
  public static final String NANO_FUNC = "MICROSECOND";
  public static final String FAST_TIME_FUNC = "UNIX_TIMESTAMP";

  // register these functions in mysql:
  /*
   DROP FUNCTION IF EXISTS c_decimal;
   DELIMITER $$
   CREATE FUNCTION c_decimal(i BIGINT, s INT) RETURNS DECIMAL(19, 5)
   BEGIN
   RETURN i / POWER(10, s);
   END$$
   DELIMITER ;

   DROP FUNCTION IF EXISTS get_int_compact;
   DELIMITER $$
   CREATE FUNCTION get_int_compact(d CHAR(19)) RETURNS INT
   BEGIN
   RETURN CONVERT(REPLACE(d, '.', ''), SIGNED);
   END$$
   DELIMITER ;

   DROP FUNCTION IF EXISTS get_scale;
   DELIMITER $$
   CREATE FUNCTION get_scale(d CHAR(19)) RETURNS INT
   BEGIN
   RETURN CHAR_LENGTH(d) - POSITION('.' in d);
   END$$
   DELIMITER ;

   DROP FUNCTION IF EXISTS u_rshift;
   DELIMITER $$
   CREATE FUNCTION u_rshift(n BIGINT, s BIGINT) RETURNS BIGINT
   BEGIN
   IF n > 0 THEN
   RETURN n >> s;
   END IF;
   RETURN (n >> s) + (2 << ~s);
   END$$
   DELIMITER ;
  */

  // a mysql compatible >>> conversion
  // refer to https://docs.oracle.com/javase/specs/jls/se7/html/jls-15.html#jls-15.19
  public static final String U_RSHIFT_FUNCTION_DEF =
      "\n"
          + "DELIMITER $$\n"
          + "DROP FUNCTION IF EXISTS u_rshift;"
          + "CREATE FUNCTION u_rshift(n BIGINT, s BIGINT) RETURNS BIGINT\n"
          + "BEGIN\n"
          + "    IF n > 0 THEN\n"
          + "        RETURN n >> s;\n"
          + "    END IF;\n"
          + "\n"
          + "    RETURN (n >> s) + (2 << ~s);\n"
          + "END$$\n"
          + "DELIMITER ;";

  public static final String COMPOSITION_DECIMAL_FUNCTION_DEF =
      "\n"
          + "DELIMITER $$\n"
          + "DROP FUNCTION IF EXISTS u_rshift"
          + DECIMAL_FUNC_NAME
          + ";\n"
          + "CREATE FUNCTION "
          + DECIMAL_FUNC_NAME
          + "(i BIGINT, s BIGINT) RETURNS DECIMAL(19, 5)\n"
          + "BEGIN\n"
          + "RETURN i / POWER(10, s);"
          + "END$$\n"
          + "DELIMITER ;";
  public static final String GET_INT_COMPACT_FUNCTION_DEF =
      "\n"
          + "DELIMITER $$\n"
          + "DROP FUNCTION IF EXISTS "
          + GET_INT_COMPACT_FUNC
          + ";\n"
          + "CREATE FUNCTION "
          + GET_INT_COMPACT_FUNC
          + "(d CHAR(19)) RETURNS BIGINT\n"
          + "BEGIN\n"
          + "RETURN CONVERT(REPLACE(d, '.', ''), SIGNED);"
          + "END$$\n"
          + "DELIMITER ;";
  public static final String GET_SCALE_FUNCTION_DEF =
      "\n"
          + "DELIMITER $$\n"
          + "DROP FUNCTION IF EXISTS "
          + GET_SCALE_FUNC
          + ";\n"
          + "CREATE FUNCTION "
          + GET_SCALE_FUNC
          + "(d CHAR(19)) RETURNS INT\n"
          + "BEGIN\n"
          + "RETURN CHAR_LENGTH(d) - POSITION('.' in d);"
          + "END$$\n"
          + "DELIMITER ;";

  // 30 rules
  public static String getTransformedSpFunction(FunctionType type, String... args) {
    switch (type) {
      case CURRENT_TIME:
        return CURRENT_TIME_FUNC; // 3 indicates million seconds
      case UNSIGNED_R_SHIFT:
        assert args.length == 2;
        final String n = args[0];
        final String s = args[1];
        return String.format("u_rshift(%s, %s)", n, s);
      case TS_NANOS:
        assert args.length == 1;
        return NANO_FUNC + "(" + args[0].replace("#nanos", "") + ")*1000";
      case TS_FASTTIME:
        assert args.length == 1;
        return FAST_TIME_FUNC + "(" + args[0].replace("#fastTime", "") + ")*1000";
      case CHAR_AT:
        assert args.length == 2;
        return String.format(
            "ASCII(CONVERT(SUBSTRING(%s, %s + 1, 1), CHAR))",
            args[0], args[1]); // substring is one based, not zero based
      case SUBSTRING:
        assert args.length == 3;
        return String.format("SUBSTRING(%s, %s + 1, %s - %s)", args[0], args[1], args[2], args[1]);
      case CONCAT:
        assert args.length == 2;
        return String.format("CONCAT(%s, %s)", args[0], args[1]);
      case VALUE_OF:
        assert args.length == 1;
        return String.format("CONVERT(%s, CHAR)", args[0]);
      case EQUALS:
        assert args.length == 2;
        return String.format("%s == %s", args[0], args[1]); // java syntax
      case NOT_EQUALS:
        assert args.length == 2;
        return String.format("%s != %s", args[0], args[1]);
      case EQUALS_IGNORE_CASE:
        assert args.length == 2;
        return String.format("LOWER(%s) == LOWER(%s)", args[0], args[1]);
      case NOT_EQUALS_IGNORE_CASE:
        assert args.length == 2;
        return String.format("LOWER(%s) != LOWER(%s)", args[0], args[1]);
      case CONTAINS:
        assert args.length == 2;
        args[1] = args[1].replace("\\", "\\\\"); // replace '\' with '\\'
        return String.format("INSTR(%s, %s)", args[0], args[1]);
        // the following 'like' related operations need to be first wrapped to valid Java syntax
        // expression in order to support Java based parsing, then in SpParser, the expression
        // should be converted back to normal MySQL valid expression
      case START_WITH:
        assert args.length == 2;
        return wrapPlaceHolder(
            "LIKE", String.format("%s, \"like\", CONCAT(%s, \"%s\")", args[0], args[1], "%"));
      case NOT_START_WITH:
        assert args.length == 2;
        return wrapPlaceHolder(
            "NOT_LIKE",
            String.format("%s, \"not_like\", CONCAT(%s, \"%s\")", args[0], args[1], "%"));
      case END_WITH:
        assert args.length == 2;
        return wrapPlaceHolder(
            "LIKE", String.format("%s, \"like\", CONCAT(\"%s\", %s)", args[0], "%", args[1]));
      case NOT_END_WITH:
        assert args.length == 2;
        return wrapPlaceHolder(
            "NOT_LIKE",
            String.format("%s, \"not_like\", CONCAT(\"%s\", %s)", args[0], "%", args[1]));
      case COMPOSITION_DECIMAL:
        assert args.length == 2;
        final String compact = args[0];
        final String scale = args[1];
        return String.format(DECIMAL_FUNC_NAME + "(%s, %s)", compact, scale);
      case CAST_INT:
        assert args.length == 1;
        return String.format("CONVERT_EXT(%s)", args[0]);
      case LENGTH:
        assert args.length == 1;
        return String.format("LENGTH(%s)", args[0]);
      case REPLACE:
        assert args.length == 3;
        return String.format("REPLACE(%s, %s, %s)", args[0], args[1], args[2]);
      case IS_EMPTY:
        assert args.length == 1;
        return String.format("%s == \"%s\"", args[0], "");
      case NOT_CONTAINS:
        assert args.length == 2;
        args[1] = args[1].replace("\\", "\\\\"); // replace '\' with '\\'
        return String.format("INSTR(%s, %s) == 0", args[0], args[1]);
      case INDEX_OF:
        assert args.length == 2;
        return String.format("index_of(%s, %s)", args[0], args[1]);
      case LAST_INDEX_OF_CHAR_2:
        assert args.length == 3;
        return String.format("last_index_of_char_from(%s, %s, %s)", args[0], args[1], args[2]);
      case LAST_INDEX_OF_CHAR:
        assert args.length == 2;
        return String.format(
            "last_index_of_char_from(%s, %s, %s)", args[0], args[1], "LENGTH(" + args[0] + ") - 1");
      case TO_TIMESTAMP:
        assert args.length == 1;
        return String.format("FROM_UNIXTIME(%s)", args[0]);
      case LOWER:
        assert args.length == 1;
        return String.format("LOWER(%s)", args[0]);
      case UPPER:
        assert args.length == 1;
        return String.format("UPPER(%s)", args[0]);
      case STR_HASHCODE:
        assert args.length == 1;
        return String.format("str_hash_code(%s)", args[0]);
      case CAST:
        assert args.length == 2;
        switch (args[1]) {
          case "CAST_TO_INTEGER":
            return String.format("CONVERT(%s, SIGNED)", args[0]);
          case "CAST_TO_REAL":
            return String.format("CONVERT(%s, DECIMAL)", args[0]);
          default:
            throw new NotImplementedException(args[1]);
        }
      default:
        throw new NotImplementedException("Not implemented type:" + type);
    }
  }

  private static String wrapPlaceHolder(String identifier, String content) {
    return String.format("PLACE_HOLDER_%s(%s)", identifier, content);
  }

  public static boolean isPlaceHolderCall(String content) {
    return content.startsWith("PLACE_HOLDER_") && content.endsWith(")");
  }

  public static String resolveCalledFunction(String content) {
    assert isPlaceHolderCall(content);
    final Matcher matcher = Pattern.compile("PLACE_HOLDER_(.*?)\\(").matcher(content);
    final boolean res = matcher.find();
    assert res;
    final String group = matcher.group(1);
    switch (group) {
      case "LIKE":
        return "like";
      case "NOT_LIKE":
        return "not like";
      default:
        throw new RuntimeException("Unexpected match:" + group);
    }
  }

  public static String resolveFunction(String func, String arg1, String arg2) {
    return String.format("%s %s %s", arg1, func, arg2);
  }

  public static SQLVarType resolvePlaceHolderFuncRetType(String placeHolderFuncName) {
    switch (placeHolderFuncName) {
      case "NOW":
        return SQLVarType.BIGINT;
      default:
        throw new NotImplementedException(placeHolderFuncName);
    }
  }

  public static String resolvePlaceHolderFuncName(String placeHolderFuncName) {
    switch (placeHolderFuncName) {
      case "NOW":
        return CURRENT_TIME_FUNC;
      default:
        throw new NotImplementedException(placeHolderFuncName);
    }
  }
}
