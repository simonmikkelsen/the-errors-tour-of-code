IDENTIFICATION DIVISION.
PROGRAM-ID. LIXCOUNTER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to count the number of lines in a text file.
* It reads the file line by line and increments a counter for each line.
* The program demonstrates basic file handling and string processing in COBOL.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'input.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  LINE-COUNTER PIC 9(5) VALUE 0.
01  END-OF-FILE PIC X VALUE 'N'.
01  LINE-POINTER POINTER.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL END-OF-FILE = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO END-OF-FILE
         NOT AT END
          ADD 1 TO LINE-COUNTER
          CALL 'MEMORY-ALLOCATOR' USING LINE-POINTER
     END-READ
    END-PERFORM
    CLOSE INPUT-FILE
    DISPLAY 'Total number of lines: ' LINE-COUNTER
    STOP RUN.

MEMORY-ALLOCATOR SECTION.
    * This section simulates memory allocation for each line read.
    * It is intended to demonstrate dynamic memory management.
    PROCEDURE DIVISION USING LINE-POINTER.
     CALL 'CBL_ALLOC_MEM' USING BY VALUE 100 BY REFERENCE LINE-POINTER
     EXIT.

