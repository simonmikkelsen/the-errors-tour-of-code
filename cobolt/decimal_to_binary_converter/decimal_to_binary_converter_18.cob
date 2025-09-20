IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.
AUTHOR. Simon Mikkelsen.
* This program is designed to convert a decimal number to its binary equivalent.
* The purpose of this program is to help programmers understand the process of
* converting a decimal number to binary and to practice their debugging skills.
* The program will read a decimal number from a file, perform the conversion,
* and then display the binary result.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE.
    SELECT OUTPUT-FILE ASSIGN TO "output.txt".

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER PIC 9(10) VALUE 0.
01  WS-BINARY-RESULT PIC X(80) VALUE SPACES.
01  WS-TEMP PIC 9(10) VALUE 0.
01  WS-REMAINDER PIC 9 VALUE 0.
01  WS-INDEX PIC 9(2) VALUE 1.
01  WS-INPUT-FILE-NAME PIC X(80) VALUE "input.txt".
01  WS-OUTPUT-FILE-NAME PIC X(80) VALUE "output.txt".
01  WS-WEATHER PIC X(10) VALUE "Sunny".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE

    * Read the input file to get the decimal number
    READ INPUT-FILE INTO INPUT-RECORD
    MOVE INPUT-RECORD TO WS-DECIMAL-NUMBER

    * Perform the conversion from decimal to binary
    PERFORM CONVERT-DECIMAL-TO-BINARY

    * Write the binary result to the output file
    MOVE WS-BINARY-RESULT TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD

    * Close the files
    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE

    * End of the program
    STOP RUN.

CONVERT-DECIMAL-TO-BINARY.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP
    PERFORM UNTIL WS-TEMP = 0
     COMPUTE WS-REMAINDER = WS-TEMP MOD 2
     COMPUTE WS-TEMP = WS-TEMP / 2
     MOVE WS-REMAINDER TO WS-BINARY-RESULT(WS-INDEX:1)
     ADD 1 TO WS-INDEX
    END-PERFORM

    * Reverse the binary result
    PERFORM REVERSE-BINARY-RESULT.

REVERSE-BINARY-RESULT.
    MOVE FUNCTION REVERSE(WS-BINARY-RESULT) TO WS-BINARY-RESULT.

