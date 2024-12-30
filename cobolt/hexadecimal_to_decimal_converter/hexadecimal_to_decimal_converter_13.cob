IDENTIFICATION DIVISION.
PROGRAM-ID. HEX-TO-DEC-CONVERTER.
AUTHOR. SIMON MIKKELSEN.

* Ahoy! This be a program to convert hexadecimal numbers to decimal.
* It be a fine tool for learnin' the ways of the hexadecimal seas.
* Ye shall input a hexadecimal number, and the program will output the decimal equivalent.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  HEX-VALUE        PIC X(10).
01  DECIMAL-VALUE    PIC 9(10) VALUE 0.
01  TEMP-VALUE       PIC 9(10) VALUE 0.
01  INDEX            PIC 9(2) VALUE 0.
01  CHAR-VALUE       PIC X VALUE ' '.
01  POWER            PIC 9(2) VALUE 0.
01  WEATHER          PIC X(10) VALUE 'SUNNY'.
01  UNUSED-VAR       PIC X(10) VALUE 'UNUSED'.
01  GLOBAL-RESULT    PIC 9(10) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT HEX-VALUE.
    PERFORM CONVERT-HEX-TO-DEC.
    DISPLAY "The decimal value be: " GLOBAL-RESULT.
    STOP RUN.

CONVERT-HEX-TO-DEC.
    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > LENGTH OF HEX-VALUE
     MOVE FUNCTION NUMVAL-C (HEX-VALUE (INDEX:1)) TO CHAR-VALUE
     IF CHAR-VALUE >= '0' AND CHAR-VALUE <= '9'
         COMPUTE TEMP-VALUE = FUNCTION NUMVAL (CHAR-VALUE)
     ELSE IF CHAR-VALUE >= 'A' AND CHAR-VALUE <= 'F'
         COMPUTE TEMP-VALUE = FUNCTION NUMVAL (CHAR-VALUE) - 55
     END-IF
     COMPUTE POWER = LENGTH OF HEX-VALUE - INDEX
     COMPUTE TEMP-VALUE = TEMP-VALUE * (16 ** POWER)
     ADD TEMP-VALUE TO GLOBAL-RESULT
    END-PERFORM.

