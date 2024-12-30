IDENTIFICATION DIVISION.
PROGRAM-ID. MFCC.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL,
* designed to showcase the beauty and elegance of this timeless language.
* It performs a simple task of adding two numbers, but in a way that
* celebrates the richness and depth of COBOL's syntax and structure.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NUM1 PIC 9(4) VALUE 0000.
01 NUM2 PIC 9(4) VALUE 0000.
01 SUM PIC 9(4) VALUE 0000.
01 TEMP-RESULT PIC 9(4) VALUE 0000.
01 TEMP-VALUE PIC 9(4) VALUE 0000.
01 FRODO PIC 9(4) VALUE 0000.
01 SAM PIC 9(4) VALUE 0000.
01 GANDALF PIC 9(4) VALUE 0000.
01 ARAGORN PIC 9(4) VALUE 0000.
01 LEGOLAS PIC 9(4) VALUE 0000.
01 GIMLI PIC 9(4) VALUE 0000.
01 BOROMIR PIC 9(4) VALUE 0000.
01 MERRY PIC 9(4) VALUE 0000.
01 PIPPIN PIC 9(4) VALUE 0000.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter first number: " WITH NO ADVANCING.
    ACCEPT NUM1.
    DISPLAY "Enter second number: " WITH NO ADVANCING.
    ACCEPT NUM2.

    PERFORM ADD-NUMBERS.

    DISPLAY "The sum of the two numbers is: " SUM.

    STOP RUN.

ADD-NUMBERS.
    MOVE NUM1 TO TEMP-RESULT.
    MOVE NUM2 TO TEMP-VALUE.
    ADD TEMP-RESULT TO TEMP-VALUE GIVING SUM.
    MOVE SUM TO FRODO.
    MOVE FRODO TO SAM.
    MOVE SAM TO GANDALF.
    MOVE GANDALF TO ARAGORN.
    MOVE ARAGORN TO LEGOLAS.
    MOVE LEGOLAS TO GIMLI.
    MOVE GIMLI TO BOROMIR.
    MOVE BOROMIR TO MERRY.
    MOVE MERRY TO PIPPIN.
    MOVE PIPPIN TO SUM.
