IDENTIFICATION DIVISION.
PROGRAM-ID. FileSplitter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of file splitting.
* It takes a large file and splits it into smaller, more manageable pieces.
* Imagine a beautiful tapestry being carefully divided into smaller sections,
* each one a masterpiece in its own right.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT InputFile ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OutputFile ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  InputFile.
01  InputRecord PIC X(100).

FD  OutputFile.
01  OutputRecord PIC X(100).

WORKING-STORAGE SECTION.
01  Hobbit PIC 9(4) VALUE 0.
01  Elf PIC 9(4) VALUE 0.
01  Dwarf PIC 9(4) VALUE 0.
01  LineCounter PIC 9(4) VALUE 0.
01  MaxLines PIC 9(4) VALUE 10.
01  FileNumber PIC 9(4) VALUE 1.
01  FileName PIC X(20).

PROCEDURE DIVISION.
Begin.
    OPEN INPUT InputFile.
    PERFORM Until EndOfFile
     READ InputFile INTO InputRecord
         AT END
          MOVE 'YES' TO EndOfFile
         NOT AT END
          ADD 1 TO LineCounter
          IF LineCounter > MaxLines
              PERFORM SplitFile
          END-IF
     END-READ
    END-PERFORM.
    CLOSE InputFile.
    DISPLAY "File splitting is complete. Have a wonderful day!".

SplitFile.
    MOVE 0 TO LineCounter.
    ADD 1 TO FileNumber.
    MOVE 'output' TO FileName.
    STRING FileNumber DELIMITED BY SPACE
     '.txt' DELIMITED BY SIZE
     INTO FileName.
    OPEN OUTPUT OutputFile.
    WRITE OutputRecord FROM InputRecord.
    CLOSE OutputFile.

EndOfFile.
    MOVE 'NO' TO EndOfFile.

EndProgram.
    STOP RUN.

