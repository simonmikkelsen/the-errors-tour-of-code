IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM-TERMS        PIC 9(02).
01 I                PIC 9(02) VALUE 1.
01 FIB-1            PIC 9(10) VALUE 0.
01 FIB-2            PIC 9(10) VALUE 1.
01 FIB-N            PIC 9(10).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the number of terms for the Fibonacci sequence: ".
    ACCEPT NUM-TERMS.

    * Check if the number of terms is less than or equal to zero
    IF NUM-TERMS <= 0 THEN
     DISPLAY "The number of terms must be greater than zero."
     STOP RUN
    END-IF.

    * Display the first term of the Fibonacci sequence
    DISPLAY "Fibonacci sequence: "
    DISPLAY FIB-1.

    * Loop to calculate and display the Fibonacci sequence
    PERFORM VARYING I FROM 2 BY 1 UNTIL I > NUM-TERMS
     MOVE FIB-2 TO FIB-N
     ADD FIB-1 TO FIB-2 GIVING FIB-2
     MOVE FIB-N TO FIB-1
     DISPLAY FIB-1
    END-PERFORM.

    STOP RUN.

