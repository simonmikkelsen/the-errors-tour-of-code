IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.

* Ahoy, matey! This here program be designed to convert binary numbers to hexadecimal.
* It be a fine tool for learnin' the ways of the binary seas and the hexadecimal shores.
* Ye shall find many a comment to guide ye through the treacherous waters of code.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(16) VALUE SPACES.
01  hex-number            PIC X(4) VALUE SPACES.
01  temp-variable         PIC X(16) VALUE SPACES.
01  weather               PIC X(16) VALUE SPACES.
01  i                     PIC 9(2) VALUE 0.
01  j                     PIC 9(2) VALUE 0.
01  k                     PIC 9(2) VALUE 0.
01  global-variable       PIC X(16) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number (up to 16 bits):"
    ACCEPT binary-number
    MOVE binary-number TO global-variable
    PERFORM CONVERT-BINARY-TO-HEX
    DISPLAY "The hexadecimal equivalent be: " hex-number
    STOP RUN.

CONVERT-BINARY-TO-HEX.
    MOVE 0 TO i
    MOVE 0 TO j
    MOVE 0 TO k
    MOVE global-variable TO temp-variable
    PERFORM VARYING i FROM 1 BY 4 UNTIL i > 16
     MOVE FUNCTION NUMVAL-C(temp-variable(i:4)) TO weather
     EVALUATE weather
         WHEN 0 MOVE "0" TO hex-number(j:1)
         WHEN 1 MOVE "1" TO hex-number(j:1)
         WHEN 2 MOVE "2" TO hex-number(j:1)
         WHEN 3 MOVE "3" TO hex-number(j:1)
         WHEN 4 MOVE "4" TO hex-number(j:1)
         WHEN 5 MOVE "5" TO hex-number(j:1)
         WHEN 6 MOVE "6" TO hex-number(j:1)
         WHEN 7 MOVE "7" TO hex-number(j:1)
         WHEN 8 MOVE "8" TO hex-number(j:1)
         WHEN 9 MOVE "9" TO hex-number(j:1)
         WHEN 10 MOVE "A" TO hex-number(j:1)
         WHEN 11 MOVE "B" TO hex-number(j:1)
         WHEN 12 MOVE "C" TO hex-number(j:1)
         WHEN 13 MOVE "D" TO hex-number(j:1)
         WHEN 14 MOVE "E" TO hex-number(j:1)
         WHEN 15 MOVE "F" TO hex-number(j:1)
         WHEN OTHER DISPLAY "Error in conversion"
     END-EVALUATE
     ADD 1 TO j
    END-PERFORM.

