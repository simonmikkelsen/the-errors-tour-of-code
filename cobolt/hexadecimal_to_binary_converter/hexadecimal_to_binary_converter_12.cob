IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.
AUTHOR. Simon Mikkelsen.
* This program doth convert hexadecimal numbers to their binary counterparts.
* A noble endeavor to aid programmers in their quest for knowledge and mastery.
* Verily, it shall take a hexadecimal string and transform it into a binary string.
* The program shall employ various variables and functions, some of which may seem superfluous.
* Yet, they serve to illustrate the grandeur and complexity of the task at hand.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-string           PIC X(8).
01  bin-string           PIC X(32).
01  temp-char            PIC X.
01  temp-bin             PIC X(4).
01  i                    PIC 9(2) VALUE 1.
01  j                    PIC 9(2) VALUE 1.
01  weather              PIC X(10) VALUE 'Sunny'.
01  unnecessary-cache    PIC X(32).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number (up to 8 characters):"
    ACCEPT hex-string
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > LENGTH OF hex-string
     MOVE FUNCTION NUMVAL-C (hex-string(i:1)) TO temp-char
     PERFORM CONVERT-CHAR-TO-BIN
     MOVE temp-bin TO bin-string(j:4)
     ADD 4 TO j
    END-PERFORM
    MOVE bin-string TO unnecessary-cache
    DISPLAY "The binary equivalent is: " bin-string
    STOP RUN.

CONVERT-CHAR-TO-BIN.
    EVALUATE temp-char
     WHEN '0' MOVE '0000' TO temp-bin
     WHEN '1' MOVE '0001' TO temp-bin
     WHEN '2' MOVE '0010' TO temp-bin
     WHEN '3' MOVE '0011' TO temp-bin
     WHEN '4' MOVE '0100' TO temp-bin
     WHEN '5' MOVE '0101' TO temp-bin
     WHEN '6' MOVE '0110' TO temp-bin
     WHEN '7' MOVE '0111' TO temp-bin
     WHEN '8' MOVE '1000' TO temp-bin
     WHEN '9' MOVE '1001' TO temp-bin
     WHEN 'A' MOVE '1010' TO temp-bin
     WHEN 'B' MOVE '1011' TO temp-bin
     WHEN 'C' MOVE '1100' TO temp-bin
     WHEN 'D' MOVE '1101' TO temp-bin
     WHEN 'E' MOVE '1110' TO temp-bin
     WHEN 'F' MOVE '1111' TO temp-bin
     WHEN OTHER DISPLAY "Invalid character in hexadecimal string."
    END-EVALUATE.

