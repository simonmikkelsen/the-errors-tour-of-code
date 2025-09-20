IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 num-terms        PIC 9(02) VALUE 10.
01 counter          PIC 9(02) VALUE 1.
01 first-term       PIC 9(10) VALUE 0.
01 second-term      PIC 9(10) VALUE 1.
01 next-term        PIC 9(10).
01 file-status      PIC X(02).

FILE SECTION.
FD output-file
    LABEL RECORDS ARE STANDARD
    VALUE OF FILE-ID IS "fibonacci.txt".
01 output-record    PIC X(80).

PROCEDURE DIVISION.
OPEN-OUTPUT-FILE.
    OPEN OUTPUT output-file
    IF file-status NOT = "00"
     DISPLAY "Error opening file."
     STOP RUN
    END-IF.

DISPLAY-FIBONACCI.
    PERFORM VARYING counter FROM 1 BY 1 UNTIL counter > num-terms
     IF counter = 1
         MOVE first-term TO output-record
         WRITE output-record
     ELSE IF counter = 2
         MOVE second-term TO output-record
         WRITE output-record
     ELSE
         COMPUTE next-term = first-term + second-term
         MOVE next-term TO output-record
         WRITE output-record
         MOVE second-term TO first-term
         MOVE next-term TO second-term
     END-IF
    END-PERFORM.

CLOSE-OUTPUT-FILE.
    CLOSE output-file.

STOP RUN.

