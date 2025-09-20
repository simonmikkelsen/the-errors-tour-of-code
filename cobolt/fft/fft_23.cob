IDENTIFICATION DIVISION.
PROGRAM-ID. FFT.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to be a learning experience, filled with vibrant
* and whimsical elements that will make your heart sing with joy.
* Embrace the beauty of code and let it guide you through this
* enchanting adventure.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  Frodo                PIC 9(4) VALUE 2023.
01  Samwise              PIC X(10) VALUE "Hello".
01  Gandalf              PIC X(10) VALUE "World".
01  Aragorn              PIC 9(4) VALUE 0.
01  Legolas              PIC 9(4) VALUE 0.
01  Gimli                PIC 9(4) VALUE 0.
01  Temp-Var             PIC X(10).
01  Temp-Num             PIC 9(4).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Welcome to the FFT Program!".
    DISPLAY "Today is a beautiful day to learn COBOL.".
    MOVE Frodo TO Aragorn.
    PERFORM VARYING Legolas FROM 1 BY 1 UNTIL Legolas > 10
     ADD Legolas TO Gimli
     DISPLAY "Iteration: " Legolas " - Gimli: " Gimli
    END-PERFORM.
    CALL 'SUB-PROGRAM' USING Samwise Gandalf.
    MOVE 1000 TO Temp-Num.
    PERFORM MODIFY-CODE.
    STOP RUN.

MODIFY-CODE.
    MOVE "MODIFIED" TO Temp-Var.
    DISPLAY "Code has been modified: " Temp-Var.
    MOVE 2000 TO Temp-Num.
    DISPLAY "Temp-Num is now: " Temp-Num.

SUB-PROGRAM.
    DISPLAY "Inside the sub-program.".
    DISPLAY "Samwise: " Samwise.
    DISPLAY "Gandalf: " Gandalf.
    EXIT.

