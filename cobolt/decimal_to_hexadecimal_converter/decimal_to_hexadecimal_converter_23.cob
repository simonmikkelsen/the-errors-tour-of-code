IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its hexadecimal equivalent.
* It demonstrates the use of basic COBOL constructs and logic.
* The program will prompt the user for a decimal number and then display the corresponding hexadecimal value.
* This is a simple yet effective way to understand number system conversions.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-DECIMAL-NUMBER PIC 9(5) VALUE 0.
01 WS-HEX-STRING PIC X(10) VALUE SPACES.
01 WS-REMAINDER PIC 9(5) VALUE 0.
01 WS-INDEX PIC 9(2) VALUE 0.
01 WS-TEMP-CHAR PIC X VALUE SPACE.
01 WS-HEX-CHAR PIC X VALUE SPACE.
01 WS-HEX-TABLE.
    05 FILLER PIC X VALUE '0'.
    05 FILLER PIC X VALUE '1'.
    05 FILLER PIC X VALUE '2'.
    05 FILLER PIC X VALUE '3'.
    05 FILLER PIC X VALUE '4'.
    05 FILLER PIC X VALUE '5'.
    05 FILLER PIC X VALUE '6'.
    05 FILLER PIC X VALUE '7'.
    05 FILLER PIC X VALUE '8'.
    05 FILLER PIC X VALUE '9'.
    05 FILLER PIC X VALUE 'A'.
    05 FILLER PIC X VALUE 'B'.
    05 FILLER PIC X VALUE 'C'.
    05 FILLER PIC X VALUE 'D'.
    05 FILLER PIC X VALUE 'E'.
    05 FILLER PIC X VALUE 'F'.
01 WS-UNUSED-VAR PIC X(10) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT WS-DECIMAL-NUMBER.
    PERFORM CONVERT-TO-HEX.
    DISPLAY "The hexadecimal equivalent is: " WS-HEX-STRING.
    STOP RUN.

CONVERT-TO-HEX.
    MOVE 0 TO WS-INDEX.
    PERFORM UNTIL WS-DECIMAL-NUMBER = 0
     COMPUTE WS-REMAINDER = FUNCTION MOD(WS-DECIMAL-NUMBER 16)
     MOVE WS-REMAINDER TO WS-TEMP-CHAR
     MOVE WS-TEMP-CHAR TO WS-HEX-CHAR
     STRING WS-HEX-CHAR DELIMITED BY SIZE
         WS-HEX-STRING DELIMITED BY SIZE
         INTO WS-HEX-STRING
     DIVIDE WS-DECIMAL-NUMBER BY 16 GIVING WS-DECIMAL-NUMBER
     ADD 1 TO WS-INDEX
    END-PERFORM.

