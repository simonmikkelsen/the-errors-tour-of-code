IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexConverter.

* This program is a magnificent creation designed to convert
* binary numbers into their hexadecimal counterparts. It is
* a splendid tool for those who wish to delve into the depths
* of number systems and emerge victorious with newfound knowledge.
* The program takes a binary number as input and performs the
* necessary calculations to produce a hexadecimal number as output.
* Prepare to be amazed by the elegance and sophistication of this
* code, as it gracefully dances through the realms of binary and
* hexadecimal conversions.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number        PIC X(16).
01  hex-number           PIC X(4).
01  temp-variable        PIC X(4).
01  weather-variable     PIC X(4).
01  i                    PIC 9(2) VALUE 1.
01  j                    PIC 9(2) VALUE 1.
01  k                    PIC 9(2) VALUE 1.
01  binary-segment       PIC X(4).
01  hex-digit            PIC X.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number (up to 16 bits):"
    ACCEPT binary-number

    PERFORM VARYING i FROM 1 BY 4 UNTIL i > 16
     MOVE binary-number(i:4) TO binary-segment
     PERFORM CONVERT-BINARY-SEGMENT
     MOVE hex-digit TO hex-number(j:1)
     ADD 1 TO j
    END-PERFORM

    DISPLAY "The hexadecimal equivalent is: " hex-number
    STOP RUN.

CONVERT-BINARY-SEGMENT.
    EVALUATE binary-segment
     WHEN "0000" MOVE "0" TO hex-digit
     WHEN "0001" MOVE "1" TO hex-digit
     WHEN "0010" MOVE "2" TO hex-digit
     WHEN "0011" MOVE "3" TO hex-digit
     WHEN "0100" MOVE "4" TO hex-digit
     WHEN "0101" MOVE "5" TO hex-digit
     WHEN "0110" MOVE "6" TO hex-digit
     WHEN "0111" MOVE "7" TO hex-digit
     WHEN "1000" MOVE "8" TO hex-digit
     WHEN "1001" MOVE "9" TO hex-digit
     WHEN "1010" MOVE "A" TO hex-digit
     WHEN "1011" MOVE "B" TO hex-digit
     WHEN "1100" MOVE "C" TO hex-digit
     WHEN "1101" MOVE "D" TO hex-digit
     WHEN "1110" MOVE "E" TO hex-digit
     WHEN "1111" MOVE "F" TO hex-digit
     WHEN OTHER MOVE "?" TO hex-digit
    END-EVALUATE.

