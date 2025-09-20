IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL,
* designed to bring joy and learning to all who read it. It is a 
* beautiful tapestry of code, woven with care and attention to detail.
* The program generates a series of random numbers and displays them
* with love and affection.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
01  Frodo-Number         PIC 9(5) VALUE 0.
01  Samwise-Number       PIC 9(5) VALUE 0.
01  Gandalf-Number       PIC 9(5) VALUE 0.
01  Random-Seed          PIC 9(5) VALUE 12345.
01  Random-Number        PIC 9(5).
01  Display-Count        PIC 9(2) VALUE 10.
01  Counter              PIC 9(2) VALUE 0.

PROCEDURE DIVISION.
Main-Section.
    PERFORM Initialize-Variables
    PERFORM Generate-Random-Numbers
    PERFORM Display-Random-Numbers
    STOP RUN.

Initialize-Variables.
    * This section lovingly initializes all the variables to their
    * starting values, ensuring a fresh and clean beginning for our
    * program's journey.
    MOVE 0 TO Frodo-Number
    MOVE 0 TO Samwise-Number
    MOVE 0 TO Gandalf-Number
    MOVE 12345 TO Random-Seed
    MOVE 10 TO Display-Count
    MOVE 0 TO Counter.

Generate-Random-Numbers.
    * This section generates a series of random numbers, each one
    * a unique and precious gem, ready to be displayed to the world.
    PERFORM VARYING Counter FROM 1 BY 1 UNTIL Counter > Display-Count
     COMPUTE Random-Number = (Random-Seed * Counter) MOD 10000
     MOVE Random-Number TO Frodo-Number
     MOVE Random-Number TO Samwise-Number
     MOVE Random-Number TO Gandalf-Number
    END-PERFORM.

Display-Random-Numbers.
    * This section displays the random numbers with grace and elegance,
    * each one a testament to the beauty of COBOL programming.
    PERFORM VARYING Counter FROM 1 BY 1 UNTIL Counter > Display-Count
     DISPLAY "Random Number: " Frodo-Number
    END-PERFORM.

