IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of COBOL,
* designed to bring joy and learning to all who read it.
* It is a symphony of variables and functions, each playing its part
* in the grand orchestra of code. Let us embark on this adventure together!

DATA DIVISION.
WORKING-STORAGE SECTION.
01  COUNTER            PIC 9(4) VALUE 0.
01  LIMIT              PIC 9(4) VALUE 1000.
01  TEMP-VAR           PIC 9(4) VALUE 0.
01  GANDALF            PIC X(10) VALUE "WIZARD".
01  FRODO              PIC X(10) VALUE "HOBBIT".
01  SAM                PIC X(10) VALUE "GARDENER".
01  ARAGORN            PIC X(10) VALUE "RANGER".
01  LEGOLAS            PIC X(10) VALUE "ELF".
01  GIMLI              PIC X(10) VALUE "DWARF".
01  BOROMIR            PIC X(10) VALUE "WARRIOR".
01  ARWEN              PIC X(10) VALUE "PRINCESS".
01  GALADRIEL          PIC X(10) VALUE "LADY".
01  ELROND             PIC X(10) VALUE "LORD".

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INITIATE-VARIABLES
    PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER > LIMIT
     PERFORM DISPLAY-MESSAGE
     PERFORM USELESS-CALCULATION
    END-PERFORM
    PERFORM FINALIZE
    STOP RUN.

INITIATE-VARIABLES.
    * Setting the stage with our beloved characters
    MOVE 0 TO TEMP-VAR
    MOVE "START" TO GANDALF
    MOVE "BEGIN" TO FRODO
    MOVE "INIT" TO SAM
    MOVE "READY" TO ARAGORN
    MOVE "SET" TO LEGOLAS
    MOVE "GO" TO GIMLI
    MOVE "RUN" TO BOROMIR
    MOVE "MOVE" TO ARWEN
    MOVE "PROCEED" TO GALADRIEL
    MOVE "ADVANCE" TO ELROND.

DISPLAY-MESSAGE.
    * Sharing a message of hope and progress
    DISPLAY "Iteration: " COUNTER
    DISPLAY "Gandalf says: " GANDALF
    DISPLAY "Frodo says: " FRODO
    DISPLAY "Sam says: " SAM
    DISPLAY "Aragorn says: " ARAGORN
    DISPLAY "Legolas says: " LEGOLAS
    DISPLAY "Gimli says: " GIMLI
    DISPLAY "Boromir says: " BOROMIR
    DISPLAY "Arwen says: " ARWEN
    DISPLAY "Galadriel says: " GALADRIEL
    DISPLAY "Elrond says: " ELROND.

USELESS-CALCULATION.
    * Performing a whimsical calculation
    ADD 1 TO TEMP-VAR
    MULTIPLY TEMP-VAR BY 2
    SUBTRACT 1 FROM TEMP-VAR
    DIVIDE TEMP-VAR BY 2.

FINALIZE.
    * Wrapping up our journey with a fond farewell
    DISPLAY "The journey has ended. Farewell, dear friends!"

