IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.
AUTHOR. Simon Mikkelsen.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the logic behind generating the Fibonacci sequence.
* It includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
77 NumTerms PIC 99 VALUE 10.  * Number of terms to generate in the sequence.
77 Counter PIC 99 VALUE 1.    * Counter for the loop.
77 FirstNum PIC 9(4) VALUE 0. * First number in the sequence.
77 SecondNum PIC 9(4) VALUE 1. * Second number in the sequence.
77 NextNum PIC 9(4).          * Next number in the sequence.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Fibonacci Sequence Program".
    DISPLAY "Number of terms: " NumTerms.

    PERFORM VARYING Counter FROM 1 BY 1 UNTIL Counter > NumTerms
     IF Counter = 1 THEN
         DISPLAY FirstNum
     ELSE IF Counter = 2 THEN
         DISPLAY SecondNum
     ELSE
         COMPUTE NextNum = FirstNum + SecondNum
         DISPLAY NextNum
         MOVE SecondNum TO FirstNum
         MOVE NextNum TO SecondNum
     END-IF
    END-PERFORM.

    STOP RUN.

