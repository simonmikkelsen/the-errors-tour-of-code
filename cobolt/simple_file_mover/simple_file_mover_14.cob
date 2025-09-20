IDENTIFICATION DIVISION.
PROGRAM-ID. SIMPLE-FILE-MOVER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to move a file from one location to another.
* It demonstrates the basic file handling capabilities of COBOL.
* The program will read a file from the source path and write it to the destination path.
* The program is written in a verbose and overly complex manner to showcase various COBOL features.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT InputFile ASSIGN TO "source.txt"
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OutputFile ASSIGN TO "destination.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  InputFile.
01  InputRecord PIC X(100).

FD  OutputFile.
01  OutputRecord PIC X(100).

WORKING-STORAGE SECTION.
01  Frodo PIC X(100).
01  Samwise PIC X(100).
01  Gandalf PIC X(100).
01  Aragorn PIC X(100).
01  Legolas PIC X(100).
01  Gimli PIC X(100).
01  Boromir PIC X(100).
01  Sauron PIC X(100).
01  Saruman PIC X(100).
01  Gollum PIC X(100).

PROCEDURE DIVISION.
Main-Logic.
    OPEN INPUT InputFile.
    OPEN OUTPUT OutputFile.

    PERFORM UNTIL EOF-InputFile
     READ InputFile INTO Frodo
     AT END
         MOVE "YES" TO EOF-InputFile
     NOT AT END
         MOVE Frodo TO OutputRecord
         WRITE OutputRecord
     END-READ
    END-PERFORM.

    CLOSE InputFile.
    CLOSE OutputFile.

    STOP RUN.

EOF-InputFile.
    MOVE "NO" TO EOF-InputFile.

