IDENTIFICATION DIVISION.
PROGRAM-ID. HexToDecConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a hexadecimal number to its decimal equivalent.
* It demonstrates the process of parsing a hexadecimal string, converting each character
* to its corresponding decimal value, and then combining these values to produce the final result.
* The program is written in a verbose manner to provide a clear understanding of each step involved.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  HexString               PIC X(10) VALUE SPACES.
01  DecimalValue            PIC 9(10) VALUE 0.
01  TempValue               PIC 9(10) VALUE 0.
01  CharValue               PIC 9(2) VALUE 0.
01  Position                PIC 9(2) VALUE 0.
01  Length                  PIC 9(2) VALUE 0.
01  Power                   PIC 9(2) VALUE 0.
01  Weather                 PIC X(10) VALUE SPACES.
01  Sun                     PIC 9(10) VALUE 0.
01  Rain                    PIC 9(10) VALUE 0.
01  Wind                    PIC 9(10) VALUE 0.

PROCEDURE DIVISION.
Main-Procedure.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT HexString.

    PERFORM VARYING Position FROM 1 BY 1 UNTIL Position > LENGTH OF HexString
     MOVE FUNCTION NUMVAL-C (HexString(Position:1)) TO CharValue
     IF CharValue >= 0 AND CharValue <= 9
         MOVE CharValue TO TempValue
     ELSE
         MOVE FUNCTION NUMVAL-C (HexString(Position:1)) - 55 TO TempValue
     END-IF
     COMPUTE Power = LENGTH OF HexString - Position
     PERFORM Calculate-Power
     ADD TempValue TO DecimalValue
    END-PERFORM

    DISPLAY "The decimal value is: " DecimalValue.

    STOP RUN.

Calculate-Power.
    IF Power = 0
     MOVE 1 TO Sun
    ELSE
     MOVE 16 TO Sun
     PERFORM VARYING Rain FROM 1 BY 1 UNTIL Rain = Power
         MULTIPLY Sun BY 16
     END-PERFORM
    END-IF
    MULTIPLY TempValue BY Sun
    MOVE TempValue TO DecimalValue.

