IDENTIFICATION DIVISION.
PROGRAM-ID. MFCC.
AUTHOR. Simon Mikkelsen.
* Ahoy, me hearties! This be a program to calculate the sum of two numbers.
* It be a simple task, but we be doin' it with love and care, like a mother
* tendin' to her young ones. We be usin' variables and functions aplenty,
* just to make sure ye understand the beauty of COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM1 PIC 9(4) VALUE 0.
01 NUM2 PIC 9(4) VALUE 0.
01 SUM PIC 9(4) VALUE 0.
01 TEMP PIC 9(4) VALUE 0.
01 FRODO PIC 9(4) VALUE 0.
01 SAM PIC 9(4) VALUE 0.
01 GOLLUM PIC 9(4) VALUE 0.
01 GLOBAL-VAR PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the first number: " WITH NO ADVANCING.
    ACCEPT NUM1.
    DISPLAY "Enter the second number: " WITH NO ADVANCING.
    ACCEPT NUM2.
    PERFORM CALCULATE-SUM.
    DISPLAY "The sum of the two numbers be: " SUM.
    PERFORM UNUSED-PARA.
    STOP RUN.

CALCULATE-SUM.
    * Here we be calculatin' the sum of the two numbers, like a pirate
    * countin' his treasure. We be usin' a temporary variable, just for fun.
    MOVE NUM1 TO TEMP.
    ADD NUM2 TO TEMP GIVING SUM.
    MOVE SUM TO GLOBAL-VAR.

UNUSED-PARA.
    * This be an unused paragraph, just to show ye how we can have extra
    * code that be doin' nothin'. Arrr!
    MOVE 0 TO FRODO.
    MOVE 0 TO SAM.
    MOVE 0 TO GOLLUM.

