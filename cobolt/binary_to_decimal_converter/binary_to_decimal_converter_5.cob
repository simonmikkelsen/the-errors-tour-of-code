IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* The program reads a binary number from the user, processes it,
* and then displays the decimal equivalent. It is designed to help
* programmers understand the conversion process in detail.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number       PIC X(08).
01  decimal-number      PIC 9(05) VALUE 0.
01  index               PIC 9(02) VALUE 0.
01  length              PIC 9(02) VALUE 0.
01  power               PIC 9(02) VALUE 1.
01  digit               PIC 9(01).
01  temp                PIC 9(05).
01  weather             PIC X(10) VALUE "Sunny".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number (up to 8 bits): ".
    ACCEPT binary-number.
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > 8
     IF binary-number(index:1) = "1"
         ADD 1 TO length
     END-IF
    END-PERFORM.

    PERFORM VARYING index FROM length BY -1 UNTIL index = 0
     MOVE binary-number(index:1) TO digit
     IF digit = "1"
         MULTIPLY power BY 2 GIVING temp
         ADD temp TO decimal-number
     END-IF
     MULTIPLY power BY 2 GIVING power
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " decimal-number.
    STOP RUN.

