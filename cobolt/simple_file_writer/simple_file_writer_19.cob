IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It is a simple file writer that
* takes user input and writes it to a file. The program is adorned
* with verbose comments to guide the reader through its majestic
* flow. Enjoy the journey through this code as it unfolds its
* grandeur before your eyes.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-USER-INPUT PIC X(100).
01  WS-EOF PIC X VALUE 'N'.
01  WS-TEMP PIC X(100).
01  WS-WEATHER PIC X(10) VALUE 'Sunny'.
01  WS-COUNT PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Welcome to the Simple File Writer Program!'
    DISPLAY 'Please enter the text you wish to write to the file:'
    ACCEPT WS-USER-INPUT

    * The user input is now captured in the variable WS-USER-INPUT.
    * We shall now proceed to open the file and write the input to it.

    OPEN OUTPUT OUTPUT-FILE
    PERFORM WRITE-RECORD
    CLOSE OUTPUT-FILE

    * The file has been closed. We shall now bid you farewell.

    DISPLAY 'The text has been successfully written to the file.'
    DISPLAY 'Thank you for using the Simple File Writer Program!'
    STOP RUN.

WRITE-RECORD.
    MOVE WS-USER-INPUT TO OUTPUT-RECORD
    WRITE OUTPUT-RECORD.

    * The record has been written to the file. We shall now check
    * if the user wishes to write more text.

    DISPLAY 'Do you wish to write more text? (Y/N):'
    ACCEPT WS-EOF

    IF WS-EOF = 'Y'
     DISPLAY 'Please enter the text you wish to write to the file:'
     ACCEPT WS-USER-INPUT
     PERFORM WRITE-RECORD
    ELSE
     EXIT.

