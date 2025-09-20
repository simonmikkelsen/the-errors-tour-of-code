IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of Fast Fourier Transform (FFT).
* It is designed to bring joy and learning to all who read and interact with it.
* The program will take an array of numbers and perform the FFT algorithm on it.
* Along the way, it will use a plethora of variables and functions to make the journey more colorful.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUMBERS.
    05 NUM-ARRAY PIC 9(4) OCCURS 10 TIMES VALUE ZEROS.
01 I PIC 9(4) VALUE 1.
01 J PIC 9(4) VALUE 1.
01 TEMP PIC 9(4) VALUE 0.
01 RESULT PIC 9(4) OCCURS 10 TIMES VALUE ZEROS.
01 GANDALF PIC 9(4) VALUE 0.
01 FRODO PIC 9(4) VALUE 0.
01 SAM PIC 9(4) VALUE 0.
01 ARAGORN PIC 9(4) VALUE 0.
01 LEGOLAS PIC 9(4) VALUE 0.
01 GIMLI PIC 9(4) VALUE 0.
01 BOROMIR PIC 9(4) VALUE 0.
01 SAURON PIC 9(4) VALUE 0.
01 SARUMAN PIC 9(4) VALUE 0.
01 MERRY PIC 9(4) VALUE 0.
01 PIPPIN PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter 10 numbers for FFT calculation:".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
     ACCEPT NUM-ARRAY(I)
    END-PERFORM.

    * The following section performs the FFT calculation.
    * It uses a nested loop to iterate through the array and perform the necessary calculations.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
     PERFORM VARYING J FROM 1 BY 1 UNTIL J > 10
         COMPUTE TEMP = NUM-ARRAY(I) * NUM-ARRAY(J)
         ADD TEMP TO RESULT(I)
     END-PERFORM
    END-PERFORM.

    * Display the results of the FFT calculation.
    DISPLAY "FFT Results:".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
     DISPLAY RESULT(I)
    END-PERFORM.

    * End of the program.
    STOP RUN.

