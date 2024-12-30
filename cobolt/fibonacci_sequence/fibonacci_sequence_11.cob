IDENTIFICATION DIVISION.
PROGRAM-ID. FibonacciSequence.

* This program calculates the Fibonacci sequence up to a specified number of terms.
* The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
* The sequence starts with 0 and 1.
* This program is designed to help programmers understand the implementation of the Fibonacci sequence in COBOL.
* Regular expressions are used to validate input and ensure it is a positive integer.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUM-TERMS        PIC 9(02).
01 WS-COUNTER          PIC 9(02) VALUE 1.
01 WS-FIB1             PIC 9(10) VALUE 0.
01 WS-FIB2             PIC 9(10) VALUE 1.
01 WS-FIB-NEXT         PIC 9(10).
01 WS-INPUT            PIC X(10).
01 WS-REGEX            PIC X(20) VALUE '^[0-9]+$'.
01 WS-MATCH            PIC X(01).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the number of terms for the Fibonacci sequence: ".
    ACCEPT WS-INPUT.

    * Validate input using regular expression
    PERFORM REGEX-VALIDATION

    IF WS-MATCH = 'N'
     DISPLAY "Invalid input. Please enter a positive integer."
     STOP RUN
    END-IF

    MOVE FUNCTION NUMVAL(WS-INPUT) TO WS-NUM-TERMS

    DISPLAY "Fibonacci sequence: "
    DISPLAY WS-FIB1
    DISPLAY WS-FIB2

    PERFORM UNTIL WS-COUNTER >= WS-NUM-TERMS
     COMPUTE WS-FIB-NEXT = WS-FIB1 + WS-FIB2
     DISPLAY WS-FIB-NEXT
     MOVE WS-FIB2 TO WS-FIB1
     MOVE WS-FIB-NEXT TO WS-FIB2
     ADD 1 TO WS-COUNTER
    END-PERFORM

    STOP RUN.

REGEX-VALIDATION.
    * Check if input matches the regular expression
    IF FUNCTION MATCHES(WS-INPUT, WS-REGEX)
     MOVE 'Y' TO WS-MATCH
    ELSE
     MOVE 'N' TO WS-MATCH
    END-IF.

