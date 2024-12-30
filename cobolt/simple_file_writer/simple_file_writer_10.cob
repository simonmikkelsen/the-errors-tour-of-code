IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It takes user input and writes it
* to a file, demonstrating the elegance and power of file handling
* in this venerable language. Prepare to be dazzled by the verbosity
* and grandeur of the comments and code structure.

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
01  WS-TEMP-VAR PIC X(100).
01  WS-WEATHER PIC X(100).
01  WS-RAIN PIC X(100).
01  WS-SUNSHINE PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the Simple File Writer Program!"
    DISPLAY "Please enter the text you wish to write to the file:"
    ACCEPT WS-USER-INPUT
    MOVE WS-USER-INPUT TO OUTPUT-RECORD
    OPEN OUTPUT OUTPUT-FILE
    WRITE OUTPUT-RECORD
    CLOSE OUTPUT-FILE
    DISPLAY "Your input has been written to the file 'output.txt'."
    DISPLAY "Thank you for using the Simple File Writer Program!"
    STOP RUN.

