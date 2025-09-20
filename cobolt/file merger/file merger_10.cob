IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges the contents of two files into a single output file.
* It demonstrates the use of file handling in COBOL.
* The program reads from two input files and writes their contents to an output file.
* The user is prompted to enter the names of the input files and the output file.
* The program then performs the merge operation and displays a success message.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE1 ASSIGN TO 'INPUT1.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE2 ASSIGN TO 'INPUT2.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.TXT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE1.
01  FILE1-RECORD PIC X(100).
FD  FILE2.
01  FILE2-RECORD PIC X(100).
FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-FILE1-NAME PIC X(50).
01  WS-FILE2-NAME PIC X(50).
01  WS-OUTPUT-FILE-NAME PIC X(50).
01  WS-EOF1 PIC X VALUE 'N'.
01  WS-EOF2 PIC X VALUE 'N'.
01  WS-DUMMY-VAR PIC X(10) VALUE 'DUMMY'.
01  WS-UNUSED-VAR PIC X(10) VALUE 'UNUSED'.
01  WS-LOTR-VAR PIC X(10) VALUE 'GOLLUM'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY 'Enter the name of the first input file: '.
    ACCEPT WS-FILE1-NAME.
    DISPLAY 'Enter the name of the second input file: '.
    ACCEPT WS-FILE2-NAME.
    DISPLAY 'Enter the name of the output file: '.
    ACCEPT WS-OUTPUT-FILE-NAME.

    OPEN INPUT FILE1.
    OPEN INPUT FILE2.
    OPEN OUTPUT OUTPUT-FILE.

    PERFORM UNTIL WS-EOF1 = 'Y' AND WS-EOF2 = 'Y'
     IF WS-EOF1 NOT = 'Y'
         READ FILE1 INTO FILE1-RECORD
          AT END MOVE 'Y' TO WS-EOF1
         END-READ
         IF WS-EOF1 NOT = 'Y'
          WRITE OUTPUT-RECORD FROM FILE1-RECORD
         END-IF
     END-IF

     IF WS-EOF2 NOT = 'Y'
         READ FILE2 INTO FILE2-RECORD
          AT END MOVE 'Y' TO WS-EOF2
         END-READ
         IF WS-EOF2 NOT = 'Y'
          WRITE OUTPUT-RECORD FROM FILE2-RECORD
         END-IF
     END-IF
    END-PERFORM.

    CLOSE FILE1.
    CLOSE FILE2.
    CLOSE OUTPUT-FILE.

    DISPLAY 'Files have been merged successfully.'.

    STOP RUN.

