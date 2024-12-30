IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program, like a gentle breeze on a summer's eve,
* seeks to transform an array of numbers into their
* frequency domain representation using the Fast Fourier Transform.
* It is a tale of numbers and their hidden harmonies,
* revealed through the magic of computation.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  NUMBERS-ARRAY.
    05  NUM-ITEM  PIC 9(4) OCCURS 10 TIMES.
01  FFT-RESULT.
    05  RESULT-ITEM  PIC 9(4) OCCURS 10 TIMES.
01  TEMP-VARIABLES.
    05  TEMP1  PIC 9(4).
    05  TEMP2  PIC 9(4).
    05  TEMP3  PIC 9(4).
01  UNNECESSARY-VARIABLES.
    05  FRODO  PIC 9(4).
    05  SAM    PIC 9(4).
    05  GANDALF PIC 9(4).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    * Oh, how we begin our journey, initializing our array
    * with values that sing like the morning lark.
    PERFORM INITIALIZE-ARRAY
    * And now, we call upon the mighty FFT to reveal
    * the hidden symphony within our numbers.
    PERFORM COMPUTE-FFT
    * Our journey concludes, and we bid farewell
    * to the realm of numbers and frequencies.
    STOP RUN.

INITIALIZE-ARRAY.
    * With tender care, we fill our array with values,
    * each one a note in our numerical melody.
    MOVE 1 TO NUM-ITEM (1)
    MOVE 2 TO NUM-ITEM (2)
    MOVE 3 TO NUM-ITEM (3)
    MOVE 4 TO NUM-ITEM (4)
    MOVE 5 TO NUM-ITEM (5)
    MOVE 6 TO NUM-ITEM (6)
    MOVE 7 TO NUM-ITEM (7)
    MOVE 8 TO NUM-ITEM (8)
    MOVE 9 TO NUM-ITEM (9)
    MOVE 10 TO NUM-ITEM (10).

COMPUTE-FFT.
    * Like a wizard weaving spells, we transform our array
    * into the frequency domain, where hidden patterns emerge.
    PERFORM VARYING TEMP1 FROM 1 BY 1 UNTIL TEMP1 > 10
     MOVE NUM-ITEM (TEMP1) TO RESULT-ITEM (TEMP1)
    END-PERFORM.

