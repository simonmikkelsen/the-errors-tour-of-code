IDENTIFICATION DIVISION.
PROGRAM-ID. MFCC.
AUTHOR. Simon Mikkelsen.
* This program, crafted with the utmost care and affection,
* is designed to demonstrate the beauty and elegance of COBOL.
* It processes data with the grace of a swan gliding on a serene lake,
* and performs calculations with the precision of a master jeweler.
* May it bring joy and enlightenment to all who read its lines.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  Frodo-Data.
    05  Frodo-Name       PIC X(20) VALUE 'Frodo Baggins'.
    05  Frodo-Age        PIC 99 VALUE 50.
    05  Frodo-Address    PIC X(50) VALUE 'The Shire'.
01  Gandalf-Data.
    05  Gandalf-Name     PIC X(20) VALUE 'Gandalf the Grey'.
    05  Gandalf-Age      PIC 99 VALUE 2019.
    05  Gandalf-Address  PIC X(50) VALUE 'Middle Earth'.
01  Temp-Data            PIC X(100).
01  Unnecessary-Cache    PIC X(100) VALUE SPACES.
01  Result               PIC 9(4).

PROCEDURE DIVISION.
Main-Section.
    DISPLAY "Welcome to the magical world of COBOL!"
    MOVE Frodo-Name TO Temp-Data
    PERFORM Process-Data
    MOVE Gandalf-Name TO Temp-Data
    PERFORM Process-Data
    DISPLAY "Processing complete. Have a wonderful day!"
    STOP RUN.

Process-Data.
    * Here we embark on a journey through the enchanted forest of data,
    * where each step is a dance, and each calculation a melody.
    MOVE LENGTH OF Temp-Data TO Result
    DISPLAY "Processing: " Temp-Data
    DISPLAY "Length: " Result
    * The data is now transformed, like a caterpillar into a butterfly.

