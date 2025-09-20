IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a certain number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
* 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  NUM-TERMS        PIC 9(02) VALUE 10.
01  COUNTER          PIC 9(02) VALUE 1.
01  FIB-1            PIC 9(10) VALUE 0.
01  FIB-2            PIC 9(10) VALUE 1.
01  NEXT-FIB         PIC 9(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Fibonacci Sequence Program".
    DISPLAY "Enter the number of terms: ".
    ACCEPT NUM-TERMS.

    DISPLAY "Fibonacci Sequence: ".
    DISPLAY FIB-1.
    DISPLAY FIB-2.

    PERFORM UNTIL COUNTER > NUM-TERMS
     COMPUTE NEXT-FIB = FIB-1 + FIB-2
     DISPLAY NEXT-FIB
     MOVE FIB-2 TO FIB-1
     MOVE NEXT-FIB TO FIB-2
     ADD 1 TO COUNTER
    END-PERFORM.

    STOP RUN.

