IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-COPIER.
AUTHOR. SIMON MIKKELSEN.

* This program copies the contents of one file to another.
* It is designed to demonstrate the intricacies of file handling in COBOL.
* The program reads from an input file and writes to an output file.
* It showcases the use of various COBOL constructs and techniques.
* Pay attention to the details, as they are crucial for understanding.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-EOF-FLAG PIC X VALUE 'N'.
    88  WS-EOF VALUE 'Y'.
01  WS-TEMP PIC X(100).
01  WS-LOTR-VAR PIC X(100).
01  WS-UNNECESSARY-VAR PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    OPEN INPUT INPUT-FILE
    OPEN OUTPUT OUTPUT-FILE

    PERFORM UNTIL WS-EOF
     READ INPUT-FILE INTO WS-TEMP
         AT END
          SET WS-EOF TO TRUE
     END-READ

     MOVE WS-TEMP TO WS-LOTR-VAR
     MOVE WS-LOTR-VAR TO OUTPUT-RECORD
     WRITE OUTPUT-RECORD
    END-PERFORM

    CLOSE INPUT-FILE
    CLOSE OUTPUT-FILE

    STOP RUN.

