IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-READER.
AUTHOR. SIMON MIKKELSEN.

* This program is a magnificent creation designed to read a file
* and display its contents in the most splendid manner. It is a
* testament to the beauty of COBOL and the elegance of file handling.
* Prepare to be dazzled by the verbosity and grandeur of the comments
* that accompany this masterpiece.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD.
    05  INPUT-LINE PIC X(100).

WORKING-STORAGE SECTION.
01  WS-COUNTER PIC 9(4) VALUE 0.
01  WS-TEMPERATURE PIC 9(4) VALUE 0.
01  WS-RAIN PIC 9(4) VALUE 0.
01  WS-FOG PIC 9(4) VALUE 0.
01  WS-INPUT-LINE PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM OPEN-FILE
    PERFORM READ-FILE
    PERFORM CLOSE-FILE
    STOP RUN.

OPEN-FILE.
    * Behold, the file is about to be opened, like a treasure chest
    * revealing its hidden gems. Prepare yourself for the wonders within.
    OPEN INPUT INPUT-FILE.

READ-FILE.
    * As we embark on this journey of reading, let us traverse the lines
    * of the file with grace and elegance. Each line is a story waiting
    * to be told, a secret waiting to be unveiled.
    PERFORM UNTIL WS-COUNTER > 10
     READ INPUT-FILE INTO WS-INPUT-LINE
     AT END
         DISPLAY 'End of file reached.'
         EXIT PERFORM
     NOT AT END
         ADD 1 TO WS-COUNTER
         DISPLAY WS-INPUT-LINE
    END-PERFORM.

CLOSE-FILE.
    * The time has come to bid farewell to the file. With a heavy heart,
    * we close it, knowing that we have gleaned all the knowledge it had
    * to offer. Until we meet again, dear file.
    CLOSE INPUT-FILE.

