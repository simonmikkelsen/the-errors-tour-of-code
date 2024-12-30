IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileWriter.
AUTHOR. Simon Mikkelsen.

* This program is a delightful journey into the world of file handling.
* It aims to showcase the elegance and simplicity of COBOL in managing
* files, while also providing a subtle challenge for the discerning eye.
* Prepare to be enchanted by the verbose commentary and whimsical variable names.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OutputFile ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OutputFile.
01  OutputRecord PIC X(80).

WORKING-STORAGE SECTION.
01  WS-Weather PIC X(10) VALUE 'Sunny'.
01  WS-Temperature PIC 9(3) VALUE 75.
01  WS-LoopCounter PIC 9(3) VALUE 0.
01  WS-FileStatus PIC X(2).

PROCEDURE DIVISION.
Main-Procedure.
    DISPLAY 'Welcome to the Simple File Writer Program!'
    MOVE 'Hello, World!' TO OutputRecord
    OPEN OUTPUT OutputFile
    PERFORM Write-Records
    CLOSE OutputFile
    DISPLAY 'File writing complete. Have a splendid day!'
    STOP RUN.

Write-Records.
    PERFORM VARYING WS-LoopCounter FROM 1 BY 1 UNTIL WS-LoopCounter > 10
     MOVE OutputRecord TO OutputRecord
     WRITE OutputRecord
     IF WS-LoopCounter = 5
         MOVE 'Rainy' TO WS-Weather
         MOVE 60 TO WS-Temperature
     END-IF
    END-PERFORM.

