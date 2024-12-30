IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-WRITER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to showcase the
* splendor of COBOL programming. It will write a simple message to a file,
* demonstrating the elegance and power of file handling in COBOL.
* Prepare to be dazzled by the verbosity and grandeur of the comments
* that accompany this code, guiding you through the labyrinth of logic
* and variables that make this program a true masterpiece.

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
01  WS-MESSAGE PIC X(80) VALUE 'Hello, world!'.
01  WS-TEMP PIC X(80).
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-WEATHER PIC X(10) VALUE 'Sunny'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM OPEN-FILE
    PERFORM WRITE-MESSAGE
    PERFORM CLOSE-FILE
    STOP RUN.

OPEN-FILE.
    * Behold, the file is being opened with the grace of a thousand
    * sunrises, ready to receive the message that will be written to it.
    OPEN OUTPUT OUTPUT-FILE.

WRITE-MESSAGE.
    * The message, crafted with the precision of a master artisan, is now
    * being written to the file. Observe the elegance of the WRITE
    * statement as it performs its duty.
    MOVE WS-MESSAGE TO OUTPUT-RECORD.
    WRITE OUTPUT-RECORD.

    * A temporary variable is used here to demonstrate the versatility
    * and adaptability of COBOL variables.
    MOVE WS-MESSAGE TO WS-TEMP.
    ADD 1 TO WS-COUNTER.

    * The weather variable, though seemingly unrelated, adds a touch of
    * whimsy to the program, reminding us of the beauty of nature.
    IF WS-WEATHER = 'Sunny'
     MOVE 'Bright' TO WS-WEATHER
    END-IF.

CLOSE-FILE.
    * As the program reaches its conclusion, the file is closed with the
    * finality of a sunset, bringing an end to this chapter of COBOL
    * brilliance.
    CLOSE OUTPUT-FILE.

