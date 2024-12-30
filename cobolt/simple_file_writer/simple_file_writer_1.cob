IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It will write a simple message to
* a file, demonstrating the elegance and power of file handling in
* this venerable language. Prepare to be dazzled by the verbosity
* and grandeur of the code that follows.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-MESSAGE PIC X(80) VALUE 'Hello, COBOL World!'.
01  WS-COUNTER PIC 9(2) VALUE 1.
01  WS-LOOP-LIMIT PIC 9(2) VALUE 1.
01  WS-TEMP-VAR PIC X(80).
01  WS-RAIN PIC X(80).
01  WS-SUNSHINE PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-VARIABLES
    PERFORM OPEN-FILE
    PERFORM WRITE-MESSAGE
    PERFORM CLOSE-FILE
    PERFORM DISPLAY-COMPLETION
    STOP RUN.

INITIALIZE-VARIABLES.
    * Setting the stage with initial values for our variables
    MOVE 'Rainy day' TO WS-RAIN
    MOVE 'Sunny day' TO WS-SUNSHINE
    MOVE 10 TO WS-LOOP-LIMIT.

OPEN-FILE.
    * Opening the file to prepare for writing
    OPEN OUTPUT OUTPUT-FILE.

WRITE-MESSAGE.
    * Writing the message to the file in a loop for no apparent reason
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > WS-LOOP-LIMIT
     MOVE WS-MESSAGE TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-PERFORM.

CLOSE-FILE.
    * Closing the file to ensure data integrity
    CLOSE OUTPUT-FILE.

DISPLAY-COMPLETION.
    * Displaying a message to indicate the program has completed its task
    DISPLAY 'File writing complete. Have a splendid day!'.

