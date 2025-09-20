IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.

* This program is a delightful journey into the world of COBOL,
* designed to help you practice and hone your programming skills.
* It performs a simple task of reading user input and processing it
* in a whimsical and enchanting manner.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  USER-INPUT           PIC X(20).
01  INTERNAL-STATE       PIC X(20) VALUE 'INITIAL STATE'.
01  TEMP-VARIABLE        PIC X(20).
01  GANDALF              PIC 9(4) VALUE 2021.
01  FRODO                PIC 9(4) VALUE 0.
01  SAMWISE              PIC 9(4) VALUE 0.
01  LEGOLAS              PIC 9(4) VALUE 0.
01  ARAGORN              PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Welcome to the FFT Program!"
    DISPLAY "Please enter a string (max 20 characters):"
    ACCEPT USER-INPUT

    * Let's process the user input in a magical way
    MOVE USER-INPUT TO TEMP-VARIABLE
    PERFORM PROCESS-INPUT

    * Display the final state of our internal variable
    DISPLAY "The final internal state is: " INTERNAL-STATE

    * End of our lovely program
    STOP RUN.

PROCESS-INPUT.
    * This procedure will transform the input in a charming manner
    MOVE TEMP-VARIABLE TO INTERNAL-STATE
    ADD GANDALF TO FRODO
    SUBTRACT SAMWISE FROM LEGOLAS
    MULTIPLY ARAGORN BY 2
    DISPLAY "Processing complete!"

