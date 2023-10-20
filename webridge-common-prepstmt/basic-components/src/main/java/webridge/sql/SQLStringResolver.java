package webridge.sql;

import com.alibaba.druid.sql.SQLUtils;
import com.alibaba.druid.sql.ast.SQLStatement;
import com.alibaba.druid.util.JdbcConstants;
import webridge.sql.ast.SQLAstVisitor;
import webridge.sql.ast.SqlVisitorUtils;
import webridge.sql.types.SQLVarType;
import webridge.symbc.numeric.PathCondition;
import org.apache.commons.lang3.tuple.Pair;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class SQLStringResolver {


  public static SymbolicSQLTemplate buildSymbolicSQLTemplate(
      SQLAstVisitor visitor, PathCondition pc) {
    final List<String> retValTypes = new ArrayList<>();
    final List<String> retValNames = new ArrayList<>();
    final List<String> retValAlias = new ArrayList<>();
    final List<String> parameterExprs = new ArrayList<>();
    final List<String> parameterTypes =
        visitor.getArgTypeLst().stream().map(SQLVarType::name).collect(Collectors.toList());

    for (Pair<String, String> argExpr : visitor.getArgExprLst()) {
      String expression = argExpr.getRight();
      if (expression.startsWith("'") && expression.endsWith("'")) {
        expression = expression.substring(1, expression.length() - 1);
      }
      parameterExprs.add(expression);
    }

    for (Pair<String, String> retColNameType : visitor.getRetValNameTypeMap()) {
      final String colName = retColNameType.getLeft();
      final String colType = retColNameType.getRight();
      retValNames.add(colName.replace("`", "").toLowerCase());
      retValTypes.add(colType);
    }

    for (Pair<String, String> retColNameAlias : visitor.getRetValNameAliasMap()) {
      retValAlias.add(retColNameAlias.getValue());
    }

    return new SymbolicSQLTemplate(
        visitor.getSqlType(),
        visitor.getSqlTemplate(),
        retValTypes,
        retValNames,
        retValAlias,
        parameterExprs,
        parameterTypes,
        Objects.requireNonNull(pc));
  }

  public static void main(String[] args) {
    final SQLAstVisitor visitor = new SQLAstVisitor(SqlVisitorUtils.CREATE_CUSTOMER_TABLE);
    SQLUtils.parseSingleStatement(SqlVisitorUtils.CREATE_CUSTOMER_TABLE, JdbcConstants.MYSQL)
        .accept(visitor);
    final SQLStatement sqlStatement =
        SQLUtils.parseSingleStatement(
            "select customerim0_.CUSTOMER_ID as CUSTOMER1_40_2_, customerim0_.CREATED_BY as CREATED_2_40_2_, customerim0_.DATE_CREATED as DATE_CRE3_40_2_, customerim0_.DATE_UPDATED as DATE_UPD4_40_2_, customerim0_.UPDATED_BY as UPDATED_5_40_2_, customerim0_.CHALLENGE_ANSWER as CHALLENG6_40_2_, customerim0_.CHALLENGE_QUESTION_ID as CHALLEN20_40_2_, customerim0_.LOCALE_CODE as LOCALE_21_40_2_, customerim0_.DEACTIVATED as DEACTIVA7_40_2_, customerim0_.EMAIL_ADDRESS as EMAIL_AD8_40_2_, customerim0_.EXTERNAL_ID as EXTERNAL9_40_2_, customerim0_.FIRST_NAME as FIRST_N10_40_2_, customerim0_.IS_TAX_EXEMPT as IS_TAX_11_40_2_, customerim0_.LAST_NAME as LAST_NA12_40_2_, customerim0_.PASSWORD as PASSWOR13_40_2_, customerim0_.PASSWORD_CHANGE_REQUIRED as PASSWOR14_40_2_, customerim0_.IS_PREVIEW as IS_PREV15_40_2_, customerim0_.RECEIVE_EMAIL as RECEIVE16_40_2_, customerim0_.IS_REGISTERED as IS_REGI17_40_2_, customerim0_.TAX_EXEMPTION_CODE as TAX_EXE18_40_2_, customerim0_.USER_NAME as USER_NA19_40_2_, customerad1_.CUSTOMER_ID as CUSTOMER5_41_4_, customerad1_.CUSTOMER_ADDRESS_ID as CUSTOMER1_41_4_, customerad1_.CUSTOMER_ADDRESS_ID as CUSTOMER1_41_0_, customerad1_.ADDRESS_ID as ADDRESS_4_41_0_, customerad1_.ADDRESS_NAME as ADDRESS_2_41_0_, customerad1_.ARCHIVED as ARCHIVED3_41_0_, customerad1_.CUSTOMER_ID as CUSTOMER5_41_0_, addressimp2_.ADDRESS_ID as ADDRESS_1_1_1_, addressimp2_.ADDRESS_LINE1 as ADDRESS_2_1_1_, addressimp2_.ADDRESS_LINE2 as ADDRESS_3_1_1_, addressimp2_.ADDRESS_LINE3 as ADDRESS_4_1_1_, addressimp2_.CITY as CITY5_1_1_, addressimp2_.COMPANY_NAME as COMPANY_6_1_1_, addressimp2_.COUNTRY as COUNTRY27_1_1_, addressimp2_.COUNTY as COUNTY7_1_1_, addressimp2_.EMAIL_ADDRESS as EMAIL_AD8_1_1_, addressimp2_.FAX as FAX9_1_1_, addressimp2_.FIRST_NAME as FIRST_N10_1_1_, addressimp2_.FULL_NAME as FULL_NA11_1_1_, addressimp2_.IS_ACTIVE as IS_ACTI12_1_1_, addressimp2_.IS_BUSINESS as IS_BUSI13_1_1_, addressimp2_.IS_DEFAULT as IS_DEFA14_1_1_, addressimp2_.IS_MAILING as IS_MAIL15_1_1_, addressimp2_.IS_STREET as IS_STRE16_1_1_, addressimp2_.ISO_COUNTRY_ALPHA2 as ISO_COU28_1_1_, addressimp2_.ISO_COUNTRY_SUB as ISO_COU17_1_1_, addressimp2_.LAST_NAME as LAST_NA18_1_1_, addressimp2_.PHONE_FAX_ID as PHONE_F29_1_1_, addressimp2_.PHONE_PRIMARY_ID as PHONE_P30_1_1_, addressimp2_.PHONE_SECONDARY_ID as PHONE_S31_1_1_, addressimp2_.POSTAL_CODE as POSTAL_19_1_1_, addressimp2_.PRIMARY_PHONE as PRIMARY20_1_1_, addressimp2_.SECONDARY_PHONE as SECONDA21_1_1_, addressimp2_.STANDARDIZED as STANDAR22_1_1_, addressimp2_.STATE_PROV_REGION as STATE_P32_1_1_, addressimp2_.SUB_STATE_PROV_REG as SUB_STA23_1_1_, addressimp2_.TOKENIZED_ADDRESS as TOKENIZ24_1_1_, addressimp2_.VERIFICATION_LEVEL as VERIFIC25_1_1_, addressimp2_.ZIP_FOUR as ZIP_FOU26_1_1_ from BLC_CUSTOMER customerim0_ left outer join BLC_CUSTOMER_ADDRESS customerad1_ on customerim0_.CUSTOMER_ID=customerad1_.CUSTOMER_ID and ( customerad1_.archived != 'Y')  left outer join BLC_ADDRESS addressimp2_ on customerad1_.ADDRESS_ID=addressimp2_.ADDRESS_ID where customerim0_.CUSTOMER_ID=?",
            //                "UPDATE BLC_CURRENCY SET DEFAULT_FLAG = ?, FRIENDLY_NAME='A' WHERE
            // CURRENCY_CODE = ?",
            //                "SELECT * FROM BLC_CURRENCY WHERE DEFAULT_FLAG = 1",
            JdbcConstants.MYSQL);
    sqlStatement.accept(visitor);
    System.out.println(sqlStatement);
  }
}
