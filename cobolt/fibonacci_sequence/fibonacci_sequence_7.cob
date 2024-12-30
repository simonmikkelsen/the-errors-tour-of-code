IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1. This program is designed to help programmers understand the logic
* behind generating the Fibonacci sequence and to practice debugging skills.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM-TERMS        PIC 9(02) VALUE 10.
01 I                PIC 9(02) VALUE 1.
01 FIB-1            PIC 9(05) VALUE 0.
01 FIB-2            PIC 9(05) VALUE 1.
01 FIB-N            PIC 9(05).
01 FIB-ARRAY.
    05 FIB-ELEMENT  PIC 9(05) OCCURS 100 TIMES.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the number of terms for the Fibonacci sequence: ".
    ACCEPT NUM-TERMS.

    IF NUM-TERMS < 2 THEN
     DISPLAY "Number of terms must be at least 2."
     STOP RUN
    END-IF.

    MOVE FIB-1 TO FIB-ELEMENT (1).
    MOVE FIB-2 TO FIB-ELEMENT (2).

    PERFORM VARYING I FROM 3 BY 1 UNTIL I > NUM-TERMS
     COMPUTE FIB-N = FIB-1 + FIB-2
     MOVE FIB-N TO FIB-ELEMENT (I)
     MOVE FIB-2 TO FIB-1
     MOVE FIB-N TO FIB-2
    END-PERFORM.

    DISPLAY "Fibonacci sequence: ".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-TERMS
     DISPLAY FIB-ELEMENT (I)
    END-PERFORM.

    STOP RUN.

