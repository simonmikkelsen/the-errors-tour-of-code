IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers understand the process of conversion.
* The program takes a binary number as input from the user and outputs the decimal value.
* It includes detailed comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number        PIC X(20).
01  decimal-number       PIC 9(10) VALUE 0.
01  index                PIC 9(2) VALUE 1.
01  length               PIC 9(2).
01  character            PIC X.
01  power                PIC 9(10) VALUE 1.
01  temp                 PIC 9(10).
01  weather              PIC X(10) VALUE 'sunny'.
01  unused-variable      PIC X(10) VALUE 'unused'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a binary number: ".
    ACCEPT binary-number.

    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF binary-number
     COMPUTE length = LENGTH OF binary-number
     MOVE FUNCTION REVERSE(binary-number) TO binary-number
     MOVE binary-number(index:1) TO character
     IF character = '1'
         COMPUTE temp = 1
     ELSE
         COMPUTE temp = 0
     END-IF
     COMPUTE decimal-number = decimal-number + (temp * power)
     COMPUTE power = power * 2
    END-PERFORM.

    DISPLAY "The decimal equivalent is: " decimal-number.

    * End of program
    STOP RUN.

