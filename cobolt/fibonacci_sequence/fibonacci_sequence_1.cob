IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a certain number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
77 NumTerms PIC 9(02) VALUE 10.  * Number of terms in the Fibonacci sequence.
77 Counter PIC 9(02) VALUE 1.    * Counter for the loop.
77 FirstTerm PIC 9(10) VALUE 0.  * First term in the Fibonacci sequence.
77 SecondTerm PIC 9(10) VALUE 1. * Second term in the Fibonacci sequence.
77 NextTerm PIC 9(10).           * Next term in the Fibonacci sequence.

PROCEDURE DIVISION.
Main-Logic.
    DISPLAY "Fibonacci Sequence:".

    PERFORM VARYING Counter FROM 1 BY 1 UNTIL Counter > NumTerms
     IF Counter = 1
         DISPLAY FirstTerm
     ELSE
         IF Counter = 2
          DISPLAY SecondTerm
         ELSE
          COMPUTE NextTerm = FirstTerm + SecondTerm
          DISPLAY NextTerm
          MOVE SecondTerm TO FirstTerm
          MOVE NextTerm TO SecondTerm
         END-IF
     END-IF
    END-PERFORM.

    STOP RUN.

