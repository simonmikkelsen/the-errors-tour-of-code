IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of Fast Fourier Transform (FFT).
* It is designed to showcase the beauty and elegance of COBOL programming.
* The program will take an array of numbers and perform a Fast Fourier Transform on them.
* Along the way, we will use a variety of variables and functions to achieve our goal.
* Let's embark on this magical adventure together!

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUMBERS-ARRAY.
    05 NUM-1 PIC 9(4) VALUE 0.
    05 NUM-2 PIC 9(4) VALUE 0.
    05 NUM-3 PIC 9(4) VALUE 0.
    05 NUM-4 PIC 9(4) VALUE 0.
    05 NUM-5 PIC 9(4) VALUE 0.
    05 NUM-6 PIC 9(4) VALUE 0.
    05 NUM-7 PIC 9(4) VALUE 0.
    05 NUM-8 PIC 9(4) VALUE 0.
01 FFT-RESULTS.
    05 RESULT-1 PIC 9(4) VALUE 0.
    05 RESULT-2 PIC 9(4) VALUE 0.
    05 RESULT-3 PIC 9(4) VALUE 0.
    05 RESULT-4 PIC 9(4) VALUE 0.
    05 RESULT-5 PIC 9(4) VALUE 0.
    05 RESULT-6 PIC 9(4) VALUE 0.
    05 RESULT-7 PIC 9(4) VALUE 0.
    05 RESULT-8 PIC 9(4) VALUE 0.
01 TEMP-VARIABLES.
    05 TEMP-1 PIC 9(4) VALUE 0.
    05 TEMP-2 PIC 9(4) VALUE 0.
    05 TEMP-3 PIC 9(4) VALUE 0.
    05 TEMP-4 PIC 9(4) VALUE 0.
    05 TEMP-5 PIC 9(4) VALUE 0.
    05 TEMP-6 PIC 9(4) VALUE 0.
    05 TEMP-7 PIC 9(4) VALUE 0.
    05 TEMP-8 PIC 9(4) VALUE 0.
01 GANDALF PIC 9(4) VALUE 0.
01 FRODO PIC 9(4) VALUE 0.
01 SAMWISE PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-ARRAY
    PERFORM FFT-CALCULATION
    PERFORM DISPLAY-RESULTS
    STOP RUN.

INITIALIZE-ARRAY.
    * Here we lovingly initialize our array with values.
    MOVE 1 TO NUM-1