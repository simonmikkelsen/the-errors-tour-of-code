IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* Ahoy! This be a program to convert decimal numbers to hexadecimal.
* It be a fine example for learnin' the ways of COBOL programming.
* Ye will find many a comment to guide ye through the treacherous waters of code.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER        PIC 9(5) VALUE 0.
01  WS-HEX-RESULT            PIC X(10) VALUE SPACES.
01  WS-TEMP-DECIMAL          PIC 9(5) VALUE 0.
01  WS-REMAINDER             PIC 9(5) VALUE 0.
01  WS-HEX-DIGIT             PIC X VALUE ' '.
01  WS-HEX-ARRAY             PIC X(16) VALUE '0123456789ABCDEF'.
01  WS-INDEX                 PIC 9(2) VALUE 0.
01  WS-COUNTER               PIC 9(2) VALUE 0.
01  WS-UNUSED-VAR            PIC X(10) VALUE 'UNUSED'.
01  WS-WEATHER               PIC X(10) VALUE 'SUNNY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-DECIMAL-NUMBER.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP-DECIMAL.
    PERFORM CONVERT-TO-HEX.
    DISPLAY "The hexadecimal value be: " WS-HEX-RESULT.
    STOP RUN.

CONVERT-TO-HEX.
    * Arrr! We be startin' the conversion process here.
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-TEMP-DECIMAL = 0
     DIVIDE WS-TEMP-DECIMAL BY 16 GIVING WS-TEMP-DECIMAL REMAINDER WS-REMAINDER
     MOVE WS-REMAINDER TO WS-INDEX
     MOVE WS-HEX-ARRAY(WS-INDEX + 1:1) TO WS-HEX-DIGIT
     STRING WS-HEX-DIGIT DELIMITED BY SIZE
         WS-HEX-RESULT DELIMITED BY SIZE
         INTO WS-HEX-RESULT
    END-PERFORM.
    * Avast! The conversion be complete.

