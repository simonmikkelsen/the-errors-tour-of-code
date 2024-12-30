IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of COBOL,
* designed to bring joy and learning to all who read it.
* It performs a simple task of calculating the sum of an array.
* Along the way, it introduces you to the beauty of COBOL syntax
* and the elegance of structured programming.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01 ARRAY-SIZE         PIC 9(02) VALUE 10.
01 ARRAY-INDEX        PIC 9(02) VALUE 1.
01 SUM                PIC 9(05) VALUE 0.
01 TEMP-VALUE         PIC 9(05) VALUE 0.
01 ARRAY-ELEMENTS.
    05 ELEMENT        PIC 9(05) OCCURS 10 TIMES VALUE 0.
01 FRODO              PIC 9(05) VALUE 0.
01 SAM                PIC 9(05) VALUE 0.
01 GANDALF            PIC 9(05) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the FFT Program!"
    PERFORM INIT-ARRAY
    PERFORM CALCULATE-SUM
    PERFORM DISPLAY-RESULT
    STOP RUN.

INIT-ARRAY.
    * This lovely paragraph initializes the array with values.
    MOVE 1 TO ARRAY-INDEX
    PERFORM VARYING ARRAY-INDEX FROM 1 BY 1 UNTIL ARRAY-INDEX > ARRAY-SIZE
     MOVE ARRAY-INDEX TO ELEMENT(ARRAY-INDEX)
    END-PERFORM.

CALCULATE-SUM.
    * This charming paragraph calculates the sum of the array elements.
    MOVE 1 TO ARRAY-INDEX
    PERFORM VARYING ARRAY-INDEX FROM 1 BY 1 UNTIL ARRAY-INDEX > ARRAY-SIZE
     ADD ELEMENT(ARRAY-INDEX) TO SUM
    END-PERFORM.

DISPLAY-RESULT.
    * This delightful paragraph displays the result of the calculation.
    DISPLAY "The sum of the array elements is: " SUM.

