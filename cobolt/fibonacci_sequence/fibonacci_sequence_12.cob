IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM-TERMS        PIC 9(02) VALUE 10.
01 FIB-SEQUENCE.
    05 FIB-TERM     OCCURS 100 TIMES PIC 9(10) VALUE 0.
01 I                PIC 9(02) VALUE 1.
01 J                PIC 9(02) VALUE 2.
01 TEMP             PIC 9(10) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the number of terms for the Fibonacci sequence: ".
    ACCEPT NUM-TERMS.

    * Initialize the first two terms of the Fibonacci sequence.
    MOVE 0 TO FIB-TERM(1).
    MOVE 1 TO FIB-TERM(2).

    * Calculate the remaining terms of the Fibonacci sequence.
    PERFORM VARYING I FROM 3 BY 1 UNTIL I > NUM-TERMS
     MOVE FIB-TERM(I - 1) TO TEMP
     ADD FIB-TERM(I - 2) TO TEMP
     MOVE TEMP TO FIB-TERM(I)
    END-PERFORM.

    * Display the Fibonacci sequence.
    DISPLAY "The Fibonacci sequence is: ".
    PERFORM VARYING J FROM 1 BY 1 UNTIL J > NUM-TERMS
     DISPLAY FIB-TERM(J)
    END-PERFORM.

    * Cache data in memory unnecessarily.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 100
     MOVE FIB-TERM(I) TO TEMP
    END-PERFORM.

    STOP RUN.

