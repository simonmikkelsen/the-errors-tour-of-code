IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.
* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
77 NumTerms PIC 9(02) VALUE 10.  * Number of terms in the Fibonacci sequence.
77 Counter PIC 9(02) VALUE 1.    * Counter for the loop.
77 FirstTerm PIC 9(05) VALUE 0.  * First term of the Fibonacci sequence.
77 SecondTerm PIC 9(05) VALUE 1. * Second term of the Fibonacci sequence.
77 NextTerm PIC 9(05).           * Next term in the Fibonacci sequence.

PROCEDURE DIVISION.
Main-Logic.
    DISPLAY "Fibonacci Sequence Program".
    DISPLAY "Number of terms: " NumTerms.

    * Display the first two terms of the Fibonacci sequence.
    DISPLAY FirstTerm.
    DISPLAY SecondTerm.

    * Loop to calculate the remaining terms of the Fibonacci sequence.
    PERFORM VARYING Counter FROM 1 BY 1 UNTIL Counter > NumTerms
     COMPUTE NextTerm = FirstTerm + SecondTerm
     DISPLAY NextTerm
     MOVE SecondTerm TO FirstTerm
     MOVE NextTerm TO SecondTerm
    END-PERFORM.

    STOP RUN.

