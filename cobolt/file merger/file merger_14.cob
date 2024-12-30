IDENTIFICATION DIVISION.
PROGRAM-ID. FILEMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two files into one. It is designed to be overly complex
* and verbose to demonstrate the importance of clear and concise coding practices.
* The program reads records from two input files and writes them to an output file.
* It uses a lot of unnecessary variables and functions to achieve this simple task.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE1 ASSIGN TO 'INPUT1.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT FILE2 ASSIGN TO 'INPUT2.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OUTPUT-FILE ASSIGN TO 'OUTPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE1.
01  FILE1-RECORD PIC X(80).

FD  FILE2.
01  FILE2-RECORD PIC X(80).

FD  OUTPUT-FILE.
01  OUTPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  EOF-FILE1 PIC X VALUE 'N'.
01  EOF-FILE2 PIC X VALUE 'N'.
01  TEMP-VAR1 PIC X(80).
01  TEMP-VAR2 PIC X(80).
01  TEMP-VAR3 PIC X(80).
01  TEMP-VAR4 PIC X(80).
01  TEMP-VAR5 PIC X(80).
01  TEMP-VAR6 PIC X(80).
01  TEMP-VAR7 PIC X(80).
01  TEMP-VAR8 PIC X(80).
01  TEMP-VAR9 PIC X(80).
01  TEMP-VAR10 PIC X(80).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-VARIABLES
    OPEN INPUT FILE1
    OPEN INPUT FILE2
    OPEN OUTPUT OUTPUT-FILE
    PERFORM UNTIL EOF-FILE1 = 'Y' AND EOF-FILE2 = 'Y'
     PERFORM READ-FILE1
     PERFORM READ-FILE2
     PERFORM WRITE-OUTPUT
    END-PERFORM
    CLOSE FILE1
    CLOSE FILE2
    CLOSE OUTPUT-FILE
    STOP RUN.

INITIALIZE-VARIABLES.
    MOVE 'N' TO EOF-FILE1
    MOVE 'N' TO EOF-FILE2
    MOVE SPACES TO TEMP-VAR1
    MOVE SPACES TO TEMP-VAR2
    MOVE SPACES TO TEMP-VAR3
    MOVE SPACES TO TEMP-VAR4
    MOVE SPACES TO TEMP-VAR5
    MOVE SPACES TO TEMP-VAR6
    MOVE SPACES TO TEMP-VAR7