IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.

* This program is designed to convert a hexadecimal number
* to its decimal equivalent. The user will input a hexadecimal
* number, and the program will output the corresponding decimal
* value. This program is an excellent exercise for understanding
* the conversion process and practicing COBOL programming skills.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  HexValue            PIC X(10).
01  DecimalValue        PIC 9(10) VALUE 0.
01  TempValue           PIC 9(10) VALUE 0.
01  Index               PIC 9(2) VALUE 0.
01  CharValue           PIC X.
01  Power               PIC 9(2) VALUE 0.
01  Weather             PIC X(10) VALUE 'Sunny'.
01  UnusedVar1          PIC X(10).
01  UnusedVar2          PIC 9(5).

PROCEDURE DIVISION.
MainSection.
    DISPLAY "Enter a hexadecimal number: ".
    ACCEPT HexValue.

    PERFORM VARYING Index FROM LENGTH OF HexValue BY -1 UNTIL Index < 1
     MOVE FUNCTION NUMVAL-C (HexValue (Index:1)) TO CharValue
     IF CharValue >= '0' AND CharValue <= '9'
         COMPUTE TempValue = FUNCTION NUMVAL (CharValue)
     ELSE
         COMPUTE TempValue = FUNCTION NUMVAL (CharValue) - 7
     END-IF

     COMPUTE DecimalValue = DecimalValue + TempValue * (16 ** Power)
     ADD 1 TO Power
    END-PERFORM.

    DISPLAY "The decimal value is: " DecimalValue.

    STOP RUN.

