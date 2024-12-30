IDENTIFICATION DIVISION.
PROGRAM-ID. fft.
AUTHOR. Simon Mikkelsen.

* This program is a delightful journey through the world of COBOL,
* designed to help you practice and hone your programming skills.
* It performs a series of operations to demonstrate various COBOL features.
* Along the way, you'll encounter a variety of variables and functions,
* each with its own unique charm and purpose.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.dat'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.dat'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMP PIC X(80).
01  WS-LOTR-VAR PIC X(20) VALUE 'Gandalf'.
01  WS-LOTR-VAR2 PIC X(20) VALUE 'Frodo'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'Unused'.
01  WS-ANOTHER-COUNTER PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE.
    OPEN OUTPUT OUTPUT-FILE.

    PERFORM UNTIL WS-COUNTER > 10
     READ INPUT-FILE INTO INPUT-RECORD
         AT END MOVE 'EOF' TO INPUT-RECORD
     END-READ

     MOVE INPUT-RECORD TO WS-TEMP
     ADD 1 TO WS-COUNTER
     MOVE WS-TEMP TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-PERFORM.

    CLOSE INPUT-FILE.

    PERFORM ANOTHER-PARA.

    CLOSE OUTPUT-FILE.

    STOP RUN.

ANOTHER-PARA.
    DISPLAY 'This is another paragraph.'
    ADD 1 TO WS-ANOTHER-COUNTER
    DISPLAY 'Counter: ' WS-ANOTHER-COUNTER
    * This paragraph does something very important,
    * but its purpose is shrouded in mystery.
    * It adds a touch of magic to our program.

