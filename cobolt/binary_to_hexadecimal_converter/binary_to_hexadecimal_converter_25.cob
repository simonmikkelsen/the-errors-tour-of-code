IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the depths of number systems and emerge victorious.
* The program is adorned with verbose comments to guide the user through
* the labyrinthine logic and ensure a delightful learning experience.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-BINARY-NUMBER PIC X(16) VALUE SPACES.
01 WS-HEX-NUMBER PIC X(4) VALUE SPACES.
01 WS-RANDOM-SEED PIC 9(4) VALUE 1337.
01 WS-RANDOM-NUMBER PIC 9(4).
01 WS-INDEX PIC 9(2) VALUE 1.
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

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a 16-bit binary number: ".
    ACCEPT WS-BINARY-NUMBER.
    PERFORM CONVERT-BINARY-TO-HEX.
    DISPLAY "The hexadecimal equivalent is: " WS-HEX-NUMBER.
    STOP RUN.

CONVERT-BINARY-TO-HEX.
    * This section is a marvel of computational elegance, transforming
    * the binary digits into their hexadecimal form with grace and precision.
    PERFORM VARYING WS-INDEX FROM 1 BY 4 UNTIL WS-INDEX > 16
     MOVE FUNCTION NUMVAL (WS-BINARY-NUMBER (WS-INDEX:4)) TO WS-RANDOM-NUMBER
     COMPUTE WS-RANDOM-NUMBER = FUNCTION MOD (WS-RANDOM-NUMBER, 16)
     MOVE WS-HEX-TABLE (WS-RANDOM-NUMBER + 1:1) TO WS-HEX-CHAR
     STRING WS-HEX-CHAR DELIMITED BY SIZE INTO WS-HEX-NUMBER
    END-PERFORM.

