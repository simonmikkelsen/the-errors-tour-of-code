IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* Ahoy, matey! This be a program to perform a Fast Fourier Transform (FFT)
* on a given set of data points. It be a magical journey through the seas
* of complex numbers and algorithms. Let us set sail and explore the wonders
* of the FFT together, with love and care.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 FFT-ARRAY.
    05 FFT-REAL-PART OCCURS 1024 TIMES PIC 9(5)V9(5).
    05 FFT-IMAGINARY-PART OCCURS 1024 TIMES PIC 9(5)V9(5).
01 I PIC 9(4) VALUE 0.
01 J PIC 9(4) VALUE 0.
01 K PIC 9(4) VALUE 0.
01 N PIC 9(4) VALUE 1024.
01 TEMP-REAL PIC 9(5)V9(5).
01 TEMP-IMAGINARY PIC 9(5)V9(5).
01 PI PIC 9(5)V9(5) VALUE 3.14159.
01 THETA PIC 9(5)V9(5).