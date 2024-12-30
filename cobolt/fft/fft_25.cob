IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of random numbers.
* It is designed to bring joy and learning to all who read it.
* The program generates a series of random numbers and displays them.
* It is a beautiful example of the elegance of COBOL programming.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 SEED-VALUE        PIC 9(4) VALUE 1337.
01 RANDOM-NUMBER     PIC 9(5).
01 COUNTER           PIC 9(2) VALUE 0.
01 MAX-COUNT         PIC 9(2) VALUE 10.
01 TEMP-VALUE        PIC 9(5).
01 FRODO             PIC 9(5).
01 SAM               PIC 9(5).
01 GANDALF           PIC 9(5).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the Random Number Generator Program!"
    DISPLAY "We will generate some random numbers for you."
    MOVE SEED-VALUE TO RANDOM-NUMBER
    PERFORM UNTIL COUNTER > MAX-COUNT
     ADD 1 TO COUNTER
     CALL 'CBL-RANDOM' USING SEED-VALUE RANDOM-NUMBER
     MOVE RANDOM-NUMBER TO TEMP-VALUE
     MOVE TEMP-VALUE TO FRODO
     MOVE FRODO TO SAM
     MOVE SAM TO GANDALF
     DISPLAY "Random Number " COUNTER ": " RANDOM-NUMBER
    END-PERFORM
    DISPLAY "Thank you for using the Random Number Generator Program!"
    STOP RUN.

