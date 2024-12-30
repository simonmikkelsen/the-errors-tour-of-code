IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.

* This program is designed to convert hexadecimal numbers to their
* decimal equivalents. It takes a hexadecimal number as input and
* processes each digit to compute the corresponding decimal value.
* The program demonstrates various COBOL constructs and operations.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT InputFile ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OutputFile ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  InputFile.
01  InputRecord PIC X(20).

FD  OutputFile.
01  OutputRecord PIC X(20).

WORKING-STORAGE SECTION.
01  HexString PIC X(20).
01  DecimalValue PIC 9(10) VALUE 0.
01  TempValue PIC 9(10).
01  Index PIC 99.
01  Char PIC X.
01  Power PIC 9(10).
01  Weather PIC X(10) VALUE 'Sunny'.
01  UnusedVar PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MainSection.
    OPEN INPUT InputFile.
    OPEN OUTPUT OutputFile.

    PERFORM ReadHexValue.

    PERFORM ConvertHexToDecimal.

    PERFORM WriteDecimalValue.

    CLOSE InputFile.
    CLOSE OutputFile.

    STOP RUN.

ReadHexValue.
    READ InputFile INTO InputRecord
     AT END
         DISPLAY 'End of file reached.'
         STOP RUN
    END-READ.
    MOVE InputRecord TO HexString.

ConvertHexToDecimal.
    MOVE LENGTH OF HexString TO Index.
    MOVE 0 TO DecimalValue.
    PERFORM VARYING Index FROM LENGTH OF HexString BY -1 UNTIL Index < 1
     MOVE FUNCTION NUMVAL-C (HexString (Index:1)) TO Char
     IF Char >= '0' AND Char <= '9'
         COMPUTE TempValue = FUNCTION NUMVAL (Char)
     ELSE
         COMPUTE TempValue = FUNCTION NUMVAL (Char) - 7
     END-IF
     COMPUTE Power = LENGTH OF HexString - Index
     COMPUTE DecimalValue = DecimalValue + TempValue * (16 ** Power)
    END-PERFORM.

WriteDecimalValue.
    MOVE DecimalValue TO OutputRecord.
    WRITE OutputRecord.

