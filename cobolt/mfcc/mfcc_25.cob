IDENTIFICATION DIVISION.
PROGRAM-ID. MFCC.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of random numbers.
* It is designed to bring joy and wonder to those who explore its depths.
* The program generates a series of random numbers and displays them.
* Each number is a unique snowflake, a testament to the beauty of randomness.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo-Seed        PIC 9(4) VALUE 1337.
01 Random-Number     PIC 9(5).
01 Gandalf-Count     PIC 9(2) VALUE 10.
01 Aragorn-Index     PIC 9(2).
01 Legolas-Temp      PIC 9(5).
01 Gimli-Array       PIC 9(5) OCCURS 10 TIMES.
01 Samwise-Helper    PIC 9(5).

PROCEDURE DIVISION.
Main-Section.
    DISPLAY "Welcome to the magical world of random numbers!".
    PERFORM Initialize-Random-Generator.
    PERFORM Generate-Random-Numbers.
    PERFORM Display-Random-Numbers.
    STOP RUN.

Initialize-Random-Generator.
    * Here we set the seed for our random number generator.
    * This seed is the heart of our randomness, the spark of life.
    MOVE Frodo-Seed TO Random-Number.

Generate-Random-Numbers.
    * This section is where the magic happens.
    * We generate a series of random numbers, each one a precious gem.
    PERFORM VARYING Aragorn-Index FROM 1 BY 1 UNTIL Aragorn-Index > Gandalf-Count
     COMPUTE Legolas-Temp = FUNCTION RANDOM(Random-Number)
     MOVE Legolas-Temp TO Gimli-Array(Aragorn-Index)
    END-PERFORM.

Display-Random-Numbers.
    * Now we display our collection of random numbers.
    * Each number is a story, a moment in time.
    PERFORM VARYING Aragorn-Index FROM 1 BY 1 UNTIL Aragorn-Index > Gandalf-Count
     DISPLAY "Random Number " Aragorn-Index ": " Gimli-Array(Aragorn-Index)
    END-PERFORM.

