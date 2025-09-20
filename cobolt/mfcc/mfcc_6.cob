IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL.
* It is designed to bring joy and learning to those who read it.
* The program performs a series of calculations and outputs the results.
* Along the way, it uses a variety of variables and functions to demonstrate
* the beauty and versatility of COBOL.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  Frodo-Variable        PIC 9(4) VALUE 0.
01  Samwise-Variable      PIC 9(4) VALUE 0.
01  Gandalf-Variable      PIC 9(4) VALUE 0.
01  Result-Variable       PIC 9(4) VALUE 0.
01  Temp-Variable         PIC 9(4) VALUE 0.
01  User-Input            PIC X(10).
01  Error-Message         PIC X(50) VALUE 'Invalid input, please try again.'.

PROCEDURE DIVISION.
Main-Section.
    DISPLAY "Welcome to the magical world of COBOL!"
    DISPLAY "Please enter a number: "
    ACCEPT User-Input
    MOVE User-Input TO Frodo-Variable
    PERFORM Calculate-Section
    DISPLAY "The result of the calculation is: " Result-Variable
    STOP RUN.

Calculate-Section.
    ADD Frodo-Variable TO Samwise-Variable GIVING Gandalf-Variable
    SUBTRACT 10 FROM Gandalf-Variable GIVING Result-Variable
    IF Result-Variable < 0
     DISPLAY Error-Message
     MOVE 0 TO Result-Variable
    END-IF.

