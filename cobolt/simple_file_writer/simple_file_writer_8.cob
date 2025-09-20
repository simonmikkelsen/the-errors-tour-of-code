IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileWriter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of COBOL,
* where we shall explore the art of writing to a file with the
* grace and elegance of a seasoned scribe. Prepare to be amazed
* by the verbosity and grandeur of our comments, as we guide you
* through each step with the utmost care and attention to detail.

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
01  WS-RECORD PIC X(80).
01  WS-UNNECESSARY-VAR PIC 9(4) VALUE 1234.
01  WS-TEMPERATURE PIC 9(4).
01  WS-UNINITIALIZED-VAR PIC X(10).
01  WS-ANOTHER-VAR PIC X(10) VALUE 'HELLO'.
01  WS-COUNTER PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    * Let us begin our magnificent journey by opening the file
    * with the utmost precision and care, ensuring that all is
    * prepared for the grand task ahead.
    OPEN OUTPUT OUTPUT-FILE

    * Now, we shall embark on the noble task of writing to the file,
    * with each record crafted with the skill of a master artisan.
    PERFORM WRITE-RECORDS

    * With our task complete, we shall now close the file, sealing
    * our work with the finality of a masterstroke.
    CLOSE OUTPUT-FILE

    * And thus, our journey comes to an end, leaving behind a legacy
    * of elegance and verbosity for future generations to admire.
    STOP RUN.

WRITE-RECORDS.
    * In this paragraph, we shall write a series of records to the file,
    * each one a testament to our skill and dedication.
    MOVE 'This is the first record.' TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD

    MOVE 'The weather is sunny.' TO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD

    MOVE 'The temperature is ' TO WS-RECORD
    STRING WS-TEMPERATURE DELIMITED BY SPACE INTO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD

    MOVE 'Uninitialized variable test: ' TO WS-RECORD
    STRING WS-UNINITIALIZED-VAR DELIMITED BY SPACE INTO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD

    MOVE 'Another variable: ' TO WS-RECORD
    STRING WS-ANOTHER-VAR DELIMITED BY SPACE INTO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD

    * We shall now increment our counter, a symbol of our progress
    * and dedication to the task at hand.
    ADD 1 TO WS-COUNTER
    MOVE 'Counter value: ' TO WS-RECORD
    STRING WS-COUNTER DELIMITED BY SPACE INTO WS-RECORD
    WRITE OUTPUT-RECORD FROM WS-RECORD

    * And thus, we conclude our record-writing endeavor, having
    * crafted each record with the utmost care and precision.
    .

