## Collection of transformation rules
### Arithmetic (8 + 13 = 21)
#### Binary
OR
AND
BINARY_OR
BINARY_AND
XOR
LEFT_SHIFT
SIGNED_RIGHT_SHIFT
UNSIGNED_RIGHT_SHIFT
PLUS
MINUS
MULTIPLY
DIVIDE
REMAINDER

#### Uinary
PLUS
MINUS
PREFIX_INCREMENT
PREFIX_DECREMENT
LOGICAL_COMPLEMENT
BITWISE_COMPLEMENT
POSTFIX_INCREMENT
POSTFIX_DECREMENT

### Comparison (6)
EQUALS
NOT_EQUALS
LESS
GREATER
LESS_EQUALS
GREATER_EQUALS

### Data type mapping (17) and type casting (17 + 1 cast)
"varchar" -> "String"
"character varying" -> "String"
"longtext" -> "longtext"
"int" -> "int"
"serial" -> "java.math.BigInteger"
"char" -> "char"
"double" -> "double"
"float" -> "float"
"integer" -> "int"
"boolean" -> "boolean"
"tinyint" -> "boolean"
"bit" -> "boolean"
"bigint" -> "long"
"datetime" -> "java.sql.Timestamp"
"timestamp" -> "java.sql.Timestamp"
"date" -> "java.sql.Date"
"decimal" -> "java.math.BigDecimal"
CAST_TO_INTEGER
CAST_TO_REAL

### String manipulations (25)
SUBSTRING
CONCAT
VALUE_OF
CONTAINS
EQUALS
NOT_EQUALS
EQUALS_IGNORE_CASE
START_WITH
NOT_START_WITH
END_WITH
NOT_END_WITH
COMPOSITION_DECIMAL
CHAR_AT
CAST_INT
LENGTH
REPLACE
IS_EMPTY
NOT_CONTAINS
INDEX_OF
LAST_INDEX_OF_CHAR_2
LAST_INDEX_OF_CHAR
TO_TIMESTAMP
UPPER
LOWER
STR_HASHCODE