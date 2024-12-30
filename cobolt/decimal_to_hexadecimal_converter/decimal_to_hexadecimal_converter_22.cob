IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.

* This program converts a decimal number to its hexadecimal equivalent.
* It is designed to help programmers understand the conversion process.
* The program takes an input decimal number and outputs the hexadecimal value.
* It includes verbose comments to explain each step in detail.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 DECIMAL-NUMBER        PIC 9(5).
01 HEXADECIMAL-NUMBER    PIC X(10).
01 TEMP-VAR              PIC 9(5).
01 WEATHER               PIC X(10).
01 COUNTER               PIC 9(2).
01 REMAINDER             PIC 9(2).
01 HEX-CHAR              PIC X.
01 HEX-STRING            PIC X(10).
01 UNUSED-VAR            PIC 9(5).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT DECIMAL-NUMBER.

    MOVE 0 TO COUNTER.
    MOVE SPACES TO HEX-STRING.

    PERFORM UNTIL DECIMAL-NUMBER = 0
     DIVIDE DECIMAL-NUMBER BY 16 GIVING DECIMAL-NUMBER REMAINDER REMAINDER
     ADD 1 TO COUNTER
     EVALUATE REMAINDER
         WHEN 0 MOVE "0" TO HEX-CHAR
         WHEN 1 MOVE "1" TO HEX-CHAR
         WHEN 2 MOVE "2" TO HEX-CHAR
         WHEN 3 MOVE "3" TO HEX-CHAR
         WHEN 4 MOVE "4" TO HEX-CHAR
         WHEN 5 MOVE "5" TO HEX-CHAR
         WHEN 6 MOVE "6" TO HEX-CHAR
         WHEN 7 MOVE "7" TO HEX-CHAR
         WHEN 8 MOVE "8" TO HEX-CHAR
         WHEN 9 MOVE "9" TO HEX-CHAR
         WHEN 10 MOVE "A" TO HEX-CHAR
         WHEN 11 MOVE "B" TO HEX-CHAR
         WHEN 12 MOVE "C" TO HEX-CHAR
         WHEN 13 MOVE "D" TO HEX-CHAR
         WHEN