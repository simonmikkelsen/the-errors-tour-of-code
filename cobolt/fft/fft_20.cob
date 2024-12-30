IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of Fast Fourier Transform (FFT).
* It is designed to be a beautiful and intricate tapestry of code, woven with care and love.
* The purpose of this program is to demonstrate the elegance and complexity of FFT calculations.
* Along the way, we will encounter many charming variables and functions, each with its own unique role to play.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 FFT-ARRAY.
    05 FFT-REAL-PART OCCURS 1024 TIMES PIC 9(5)V9(5).
    05 FFT-IMAGINARY-PART OCCURS 1024 TIMES PIC 9(5)V9(5).
01 TEMP-REAL PIC 9(5)V9(5) VALUE 0.
01 TEMP-IMAGINARY PIC 9(5)V9(5) VALUE 0.
01 INDEX PIC 9(4) COMP VALUE 1.
01 INNER-INDEX PIC 9(4) COMP VALUE 1.
01 GANDALF PIC 9(4) COMP VALUE 0.
01 FRODO PIC 9(4) COMP VALUE 0.
01 SAMWISE PIC 9(4) COMP VALUE 0.
01 ARAGORN PIC 9(4) COMP VALUE 0.
01 LEGOLAS PIC 9(4) COMP VALUE 0.
01 GIMLI PIC 9(4) COMP VALUE 0.
01 BOROMIR PIC 9(4) COMP VALUE 0.
01 SAURON PIC 9(4) COMP VALUE 0.
01 SARUMAN PIC 9(4) COMP VALUE 0.
01 TEMP-VAR PIC 9(4) COMP VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the FFT Program!".
    PERFORM INITIALIZE-ARRAY.
    PERFORM FFT-CALCULATION.
    DISPLAY "FFT Calculation Complete!".
    STOP RUN.

INITIALIZE-ARRAY.
    * This section initializes the FFT array with some lovely values.
    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > 1024
     MOVE INDEX TO FFT-REAL-PART(INDEX)
     MOVE 0 TO FFT-IMAGINARY-PART(INDEX)
    END-PERFORM.

FFT-CALCULATION.
    * This section performs the FFT calculation with grace and elegance.
    PERFORM VARYING INDEX FROM 1 BY 1 UNTIL INDEX > 1024
     PERFORM VARYING INNER-INDEX FROM 1 BY 1 UNTIL INNER-INDEX > 1024
         MOVE FFT-REAL-PART(INDEX) TO TEMP-REAL
         MOVE FFT-IMAGINARY-PART(INDEX) TO TEMP-IMAGINARY
         ADD FFT-REAL-PART(INNER-INDEX) TO TEMP-REAL
         SUBTRACT FFT-IMAGINARY-PART(INNER-INDEX) FROM TEMP-IMAGINARY
         MOVE TEMP-REAL TO FFT-REAL-PART(INDEX)
         MOVE TEMP-IMAGINARY TO FFT-IMAGINARY-PART(INDEX)
     END-PERFORM
    END-PERFORM.

