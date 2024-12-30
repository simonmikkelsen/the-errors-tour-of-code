IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NumTerms        PIC 9(02) VALUE 10.
01 FibonacciArray.
    05 FibElement  OCCURS 100 TIMES PIC 9(10) VALUE 0.
01 Index           PIC 9(02) VALUE 1.
01 Temp1           PIC 9(10) VALUE 0.
01 Temp2           PIC 9(10) VALUE 1.
01 Temp3           PIC 9(10) VALUE 0.

PROCEDURE DIVISION.
Main-Logic.
    DISPLAY "Enter the number of terms for the Fibonacci sequence: ".
    ACCEPT NumTerms.

    IF NumTerms < 2 THEN
     DISPLAY "Number of terms must be at least 2."
     STOP RUN
    END-IF.

    MOVE 0 TO FibElement (1).
    MOVE 1 TO FibElement (2).

    PERFORM VARYING Index FROM 3 BY 1 UNTIL Index > NumTerms
     MOVE FibElement (Index - 1) TO Temp1
     MOVE FibElement (Index - 2) TO Temp2
     ADD Temp1 TO Temp2 GIVING Temp3
     MOVE Temp3 TO FibElement (Index)
    END-PERFORM.

    DISPLAY "Fibonacci sequence: ".
    PERFORM VARYING Index FROM 1 BY 1 UNTIL Index > NumTerms
     DISPLAY FibElement (Index)
    END-PERFORM.

    * Allocate memory for the Fibonacci sequence (simulated)
    CALL 'C$ALLOC' USING BY VALUE NumTerms BY REFERENCE FibonacciArray.

    * Deallocate memory (simulated)
    * CALL 'C$FREE' USING BY REFERENCE FibonacciArray.

    STOP RUN.

