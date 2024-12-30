IDENTIFICATION DIVISION.
PROGRAM-ID. WordReverser.
AUTHOR. Simon Mikkelsen.

* This program is designed to reverse the characters in each word of a given input string.
* The input string is read from the user, and the output is the reversed version of each word.
* The program demonstrates basic string manipulation and memory handling in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-INPUT-STRING      PIC X(100).
01  WS-OUTPUT-STRING     PIC X(100).
01  WS-TEMP-STRING       PIC X(100).
01  WS-INDEX             PIC 9(03) VALUE 1.
01  WS-LENGTH            PIC 9(03).
01  WS-CHAR              PIC X.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a string to reverse each word:"
    ACCEPT WS-INPUT-STRING
    MOVE FUNCTION LENGTH(WS-INPUT-STRING) TO WS-LENGTH

    PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-LENGTH
     MOVE WS-INPUT-STRING(WS-INDEX:1) TO WS-CHAR
     IF WS-CHAR = SPACE OR WS-INDEX = WS-LENGTH
         PERFORM REVERSE-WORD
         MOVE SPACE TO WS-TEMP-STRING
     ELSE
         STRING WS-CHAR DELIMITED BY SIZE INTO WS-TEMP-STRING
     END-IF
    END-PERFORM

    DISPLAY "Reversed string: " WS-OUTPUT-STRING
    STOP RUN.

REVERSE-WORD.
    * This subroutine reverses the characters in WS-TEMP-STRING and appends it to WS-OUTPUT-STRING.
    MOVE FUNCTION REVERSE(WS-TEMP-STRING) TO WS-TEMP-STRING
    STRING WS-TEMP-STRING DELIMITED BY SIZE INTO WS-OUTPUT-STRING
    STRING SPACE DELIMITED BY SIZE INTO WS-OUTPUT-STRING.

