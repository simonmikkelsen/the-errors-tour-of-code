IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.

* This program converts a decimal number to its hexadecimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program takes a decimal number as input and outputs the hexadecimal representation.
* The conversion is done using repeated division by 16 and mapping the remainders to hexadecimal digits.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimal-number        PIC 9(5) VALUE 0.
01  remainder             PIC 9(1).
01  hex-string            PIC X(10) VALUE SPACES.
01  hex-digit             PIC X.
01  index                 PIC 9(2) VALUE 0.
01  temp-variable         PIC 9(5).
01  weather               PIC X(10) VALUE "Sunny".
01  unused-variable       PIC 9(5) VALUE 0.
01  another-unused-var    PIC X(10) VALUE "Rainy".

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT decimal-number.

    PERFORM CONVERT-TO-HEX UNTIL decimal-number = 0.

    DISPLAY "The hexadecimal representation is: " hex-string.

    CLOSE-RESOURCE.

    STOP RUN.

CONVERT-TO-HEX.
    MOVE decimal-number TO temp-variable.
    DIVIDE temp-variable BY 16 GIVING decimal-number REMAINDER remainder.
    MOVE remainder TO temp-variable.
    IF temp-variable < 10
     MOVE temp-variable TO hex-digit
    ELSE
     COMPUTE hex-digit = FUNCTION NUMVAL-C (temp-variable + 55).
    END-IF
    STRING hex-digit DELIMITED BY SIZE INTO hex-string.
    ADD 1 TO index.

CLOSE-RESOURCE.
    DISPLAY "Closing resource...".
    * Imagine this is closing a file or a database connection.
    * This is just a placeholder for the actual resource closing code.

