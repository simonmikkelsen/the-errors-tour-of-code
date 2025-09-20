IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert
* binary numbers into their glorious hexadecimal counterparts.
* It is a testament to the beauty of programming and the elegance
* of computational logic. Prepare to be dazzled by its brilliance!

DATA DIVISION.
WORKING-STORAGE SECTION.
01 BINARY-NUMBER       PIC X(16).
01 HEXADECIMAL-NUMBER  PIC X(4).
01 TEMP-VAR            PIC X(4).
01 WEATHER             PIC X(4).
01 INDEX               PIC 9(2) VALUE 1.
01 HEX-CHAR            PIC X.
01 BINARY-SEGMENT      PIC X(4).
01 SEGMENT-VALUE       PIC 9(2).
01 HEX-DIGITS          PIC X(16) VALUE '0123456789ABCDEF'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a 16-bit binary number: " WITH NO ADVANCING.
    ACCEPT BINARY-NUMBER.

    PERFORM VARYING INDEX FROM 1 BY 4 UNTIL INDEX > 16
     MOVE BINARY-NUMBER (INDEX:4) TO BINARY-SEGMENT
     PERFORM CONVERT-BINARY-TO-DECIMAL
     MOVE HEX-CHAR TO HEXADECIMAL-NUMBER (INDEX / 4)
    END-PERFORM.

    DISPLAY "The hexadecimal equivalent is: " HEXADECIMAL-NUMBER.

    STOP RUN.

CONVERT-BINARY-TO-DECIMAL.
    MOVE 0 TO SEGMENT-VALUE.
    IF BINARY-SEGMENT(1:1) = '1'
     ADD 8 TO SEGMENT-VALUE
    END-IF.
    IF BINARY-SEGMENT(2:1) = '1'
     ADD 4 TO SEGMENT-VALUE
    END-IF.
    IF BINARY-SEGMENT(3:1) = '1'
     ADD 2 TO SEGMENT-VALUE
    END-IF.
    IF BINARY-SEGMENT(4:1) = '1'
     ADD 1 TO SEGMENT-VALUE
    END-IF.

    MOVE HEX-DIGITS (SEGMENT-VALUE + 1:1) TO HEX-CHAR.

