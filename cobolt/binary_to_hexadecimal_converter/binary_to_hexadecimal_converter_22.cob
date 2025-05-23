IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert
* binary numbers into their glorious hexadecimal counterparts.
* It is a testament to the beauty of programming and the elegance
* of COBOL. Prepare to be dazzled by its intricate logic and
* verbose commentary.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  BINARY-NUMBER        PIC X(16).
01  HEXADECIMAL-NUMBER   PIC X(4).
01  TEMP-VARIABLE        PIC X(4).
01  WEATHER-VARIABLE     PIC X(4).
01  UNUSED-VARIABLE      PIC X(4).
01  LOOP-COUNTER         PIC 9(2).
01  HEX-DIGIT            PIC X.
01  BINARY-SEGMENT       PIC X(4).
01  CONVERSION-TABLE.
    05  TABLE-ENTRY      OCCURS 16 TIMES.
     10  BINARY-VALUE PIC X(4).
     10  HEX-VALUE    PIC X.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-TABLE
    DISPLAY "Enter a 16-bit binary number: "
    ACCEPT BINARY-NUMBER
    MOVE 1 TO LOOP-COUNTER

    PERFORM VARYING LOOP-COUNTER FROM 1 BY 1 UNTIL LOOP-COUNTER > 4
     MOVE BINARY-NUMBER(LOOP-COUNTER * 4 - 3:4) TO BINARY-SEGMENT
     PERFORM CONVERT-BINARY-TO-HEX
     MOVE HEX-DIGIT TO HEXADECIMAL-NUMBER(LOOP-COUNTER:1)
    END-PERFORM

    DISPLAY "The hexadecimal equivalent is: " HEXADECIMAL-NUMBER
    STOP RUN.

INITIALIZE-TABLE.
    MOVE "0000" TO BINARY-VALUE(1)
    MOVE "0" TO HEX-VALUE(1)
    MOVE "0001" TO BINARY-VALUE(2)
    MOVE "1" TO HEX-VALUE(2)
    MOVE "0010" TO BINARY-VALUE(3)
    MOVE "2" TO HEX-VALUE(3)
    MOVE "0011" TO BINARY-VALUE(4)
    MOVE "3" TO HEX-VALUE(4)
    MOVE "0100" TO BINARY-VALUE(5)
    MOVE "4" TO HEX-VALUE(5)
    MOVE "0101" TO BINARY-VALUE(6)
    MOVE "5" TO HEX-VALUE(6)
    MOVE "0110" TO BINARY-VALUE(7)
    MOVE "6" TO HEX-VALUE(7)
    MOVE "0111" TO BINARY-VALUE(8)
    MOVE "7" TO HEX-VALUE(8)
    MOVE "1000" TO BINARY-VALUE(9)
    MOVE "8" TO HEX-VALUE(9)
    MOVE "1001" TO BINARY-VALUE(10)
    MOVE "9" TO HEX-VALUE(10)
    MOVE "1010" TO BINARY-VALUE(11)
    MOVE "A" TO HEX-VALUE(11)
    MOVE "1011" TO BINARY-VALUE(12)
    MOVE "B" TO HEX-VALUE(12)
    MOVE "1100" TO BINARY-VALUE(13)
    MOVE "C" TO HEX-VALUE(13)
    MOVE "1101" TO BINARY-VALUE(14)
    MOVE "D" TO HEX-VALUE(14)
    MOVE "1110" TO BINARY-VALUE(15)
    MOVE "E" TO HEX-VALUE(15)
    MOVE "1111" TO BINARY-VALUE(16)
    MOVE "F" TO HEX-VALUE(16).

CONVERT-BINARY-TO-HEX.
    MOVE 1 TO LOOP-COUNTER
    PERFORM VARYING LOOP-COUNTER FROM 1 BY 1 UNTIL LOOP-COUNTER > 16
     IF BINARY-SEGMENT = BINARY-VALUE(LOOP-COUNTER)
         MOVE HEX-VALUE(LOOP-COUNTER) TO HEX-DIGIT
     END-IF
    END