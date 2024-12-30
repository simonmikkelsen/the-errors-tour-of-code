IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a user-defined number.
* The Fibonacci sequence is a series of numbers where each number is the sum
* of the two preceding ones, usually starting with 0 and 1.
* The purpose of this program is to demonstrate basic COBOL programming concepts
* such as user input, loops, and conditionals.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  NUM1            PIC 9(10) VALUE 0.
01  NUM2            PIC 9(10) VALUE 1.
01  NEXTNUM         PIC 9(10).
01  COUNTER         PIC 9(10) VALUE 1.
01  LIMIT           PIC 9(10).
01  USER-INPUT      PIC X(50).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the number of Fibonacci sequence terms to generate: ".
    ACCEPT USER-INPUT.
    MOVE FUNCTION NUMVAL(USER-INPUT) TO LIMIT.

    PERFORM UNTIL COUNTER > LIMIT
     DISPLAY NUM1
     MOVE NUM1 TO NEXTNUM
     ADD NUM2 TO NEXTNUM
     MOVE NUM2 TO NUM1
     MOVE NEXTNUM TO NUM2
     ADD 1 TO COUNTER
    END-PERFORM.

    STOP RUN.

