IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program uses a global variable to store the current term in the sequence.

DATA DIVISION.
WORKING-STORAGE SECTION.
77 NUM-TERMS PIC 9(02) VALUE 10.
77 CURRENT-TERM PIC 9(10) VALUE 0.
77 PREV-TERM1 PIC 9(10) VALUE 0.
77 PREV-TERM2 PIC 9(10) VALUE 1.
77 I PIC 9(02) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Fibonacci Sequence Program"
    DISPLAY "Enter the number of terms: "
    ACCEPT NUM-TERMS

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-TERMS
     IF I = 1 THEN
         MOVE 0 TO CURRENT-TERM
     ELSE IF I = 2 THEN
         MOVE 1 TO CURRENT-TERM
     ELSE
         ADD PREV-TERM1 TO PREV-TERM2 GIVING CURRENT-TERM
         MOVE PREV-TERM2 TO PREV-TERM1
         MOVE CURRENT-TERM TO PREV-TERM2
     END-IF
     DISPLAY "Term " I ": " CURRENT-TERM
    END-PERFORM

    STOP RUN.

