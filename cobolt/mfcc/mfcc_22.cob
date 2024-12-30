IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL,
* designed to showcase the beauty and elegance of this timeless language.
* It performs a series of whimsical calculations and prints the results
* with a touch of magic and wonder.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC 9(4) VALUE 1000.
01 Sam PIC 9(4).
01 Gandalf PIC 9(4) VALUE 2000.
01 Aragorn PIC 9(4).
01 Legolas PIC 9(4).
01 Gimli PIC 9(4).
01 Result PIC 9(4).
01 Temp PIC 9(4).

PROCEDURE DIVISION.
MAIN-LOGIC.
    * Begin our enchanting journey with a warm greeting
    DISPLAY "Welcome to the magical world of COBOL!"
    
    * Perform a series of whimsical calculations
    MOVE Frodo TO Sam
    ADD Gandalf TO Sam GIVING Result
    DISPLAY "The result of Frodo and Gandalf's combined magic is: " Result

    * A touch of elven grace
    MOVE 500 TO Legolas
    MULTIPLY Legolas BY 2 GIVING Temp
    SUBTRACT Temp FROM Result GIVING Result
    DISPLAY "After Legolas' graceful touch, the result is: " Result

    * A dwarf's strength
    MOVE 300 TO Gimli
    ADD Gimli TO Result GIVING Result
    DISPLAY "With Gimli's strength, the final result is: " Result

    * End our journey with a fond farewell
    DISPLAY "Thank you for joining us on this magical adventure!"

    STOP RUN.

