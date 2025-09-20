IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It will write a simple message to a file,
* demonstrating the elegance and power of file handling in COBOL.
* Prepare to be dazzled by the verbosity and grandeur of the comments
* that accompany this masterpiece.

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
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-REGEX PIC X(80) VALUE '.*COBOL.*'.
01  WS-RAIN PIC X(80) VALUE 'Rainy'.
01  WS-TEMP PIC 9(3) VALUE 75.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM OPEN-FILE.
    PERFORM WRITE-MESSAGE.
    PERFORM CLOSE-FILE.
    STOP RUN.

OPEN-FILE.
    * Behold the grand opening of the file, a gateway to the digital realm
    * where our message shall be inscribed for eternity.
    OPEN OUTPUT OUTPUT-FILE.

WRITE-MESSAGE.
    * With great care and precision, we now write our message to the file,
    * ensuring that every character is perfectly placed.
    MOVE WS-MESSAGE TO OUTPUT-RECORD.
    WRITE OUTPUT-RECORD.

    * Let us now engage in a whimsical loop, for no particular reason other
    * than to demonstrate the versatility of COBOL.
    PERFORM VARYING WS-COUNTER FROM 1 BY 1 UNTIL WS-COUNTER > 10
     DISPLAY 'Iteration: ' WS-COUNTER
    END-PERFORM.

    * A touch of regex magic, to add a sprinkle of complexity and wonder.
    IF WS-MESSAGE MATCHES WS-REGEX
     DISPLAY 'Message contains the word COBOL.'
    END-IF.

CLOSE-FILE.
    * As the curtain falls, we gracefully close the file, sealing our message
    * within its digital confines.
    CLOSE OUTPUT-FILE.

