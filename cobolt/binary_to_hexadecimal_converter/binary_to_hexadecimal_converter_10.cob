IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for those who
* wish to delve into the wondrous world of number systems. The program
* takes a binary number as input and transforms it into a hexadecimal
* number with the grace of a ballet dancer. Prepare to be amazed by the
* elegance and sophistication of this code.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-BINARY-NUMBER PIC X(32).
01 WS-HEX-NUMBER PIC X(8).
01 WS-INDEX PIC 9(2) VALUE 1.
01 WS-TEMP PIC X(4).
01 WS-HEX-DIGIT PIC X.
01 WS-USER-INPUT PIC X(32).
01 WS-RESULT PIC X(8).
01 WS-RAIN PIC X(32).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number: " WITH NO ADVANCING.
    ACCEPT WS-USER-INPUT.
    MOVE WS-USER-INPUT TO WS-BINARY-NUMBER.

    PERFORM VARYING WS-INDEX FROM 1 BY 4 UNTIL WS-INDEX > 32
     MOVE FUNCTION NUMVAL-C(WS-BINARY-NUMBER(WS-INDEX:4)) TO WS-TEMP
     EVALUATE WS-TEMP
         WHEN "0000" MOVE "0" TO WS-HEX-DIGIT
         WHEN "0001" MOVE "1" TO WS-HEX-DIGIT
         WHEN "0010" MOVE "2" TO WS-HEX-DIGIT
         WHEN "0011" MOVE "3" TO WS-HEX-DIGIT
         WHEN "0100" MOVE "4" TO WS-HEX-DIGIT
         WHEN "0101" MOVE "5" TO WS-HEX-DIGIT
         WHEN "0110" MOVE "6" TO WS-HEX-DIGIT
         WHEN "0111" MOVE "7" TO WS-HEX-DIGIT
         WHEN "1000" MOVE "8" TO WS-HEX-DIGIT
         WHEN "1001" MOVE "9" TO WS-HEX-DIGIT
         WHEN "1010" MOVE "A" TO WS-HEX-DIGIT
         WHEN "1011" MOVE "B" TO WS-HEX-DIGIT
         WHEN "1100" MOVE "C" TO WS-HEX-DIGIT
         WHEN "1101" MOVE "D" TO WS-HEX-DIGIT
         WHEN "1110" MOVE "E" TO WS-HEX-DIGIT
         WHEN "1111" MOVE "F" TO WS-HEX-DIGIT
         WHEN OTHER MOVE "?" TO WS-HEX-DIGIT
     END-EVALUATE
     STRING WS-HEX-DIGIT DELIMITED BY SIZE INTO WS-HEX-NUMBER
    END-PERFORM.

    MOVE WS-HEX-NUMBER TO WS-RESULT.
    DISPLAY "The hexadecimal equivalent is: " WS-RESULT.

    * The program has reached its glorious conclusion. The binary number
    * has been transformed into a hexadecimal number with the precision
    * of a master craftsman. The user can now bask in the glory of their
    * newfound knowledge.

    STOP RUN.

