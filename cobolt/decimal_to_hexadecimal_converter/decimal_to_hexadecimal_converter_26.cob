IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.

* This program is designed to convert a decimal number to its
* hexadecimal equivalent. It demonstrates the use of various COBOL
* features including arithmetic operations, loops, and conditional
* statements. The program also includes a random number generator
* to add an element of unpredictability to the conversion process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimalNumber        PIC 9(5) VALUE 0.
01  hexadecimalNumber    PIC X(10) VALUE SPACES.
01  randomNumber         PIC 9(5) VALUE 12345.
01  remainder            PIC 9(5) VALUE 0.
01  quotient             PIC 9(5) VALUE 0.
01  index                PIC 9(2) VALUE 0.
01  hexDigit             PIC X VALUE ' '.
01  weather              PIC X(10) VALUE 'Sunny'.
01  tempVar              PIC 9(5) VALUE 0.
01  unusedVar            PIC 9(5) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: ".
    ACCEPT decimalNumber.

    * Generate a random number (not really random)
    MOVE 12345 TO randomNumber.

    * Initialize the index for hexadecimal conversion
    MOVE 1 TO index.

    PERFORM UNTIL decimalNumber = 0
     DIVIDE decimalNumber BY 16 GIVING quotient REMAINDER remainder
     MOVE quotient TO decimalNumber

     * Convert remainder to hexadecimal digit
     IF remainder < 10
         ADD remainder TO 48 GIVING tempVar
         MOVE FUNCTION CHAR(tempVar) TO hexDigit
     ELSE
         ADD remainder TO 55 GIVING tempVar
         MOVE FUNCTION CHAR(tempVar) TO hexDigit
     END-IF

     * Store the hex digit in the result string
     MOVE hexDigit TO hexadecimalNumber(index:1)
     ADD 1 TO index
    END-PERFORM.

    * Reverse the hexadecimal string
    PERFORM VARYING index FROM 1 BY 1 UNTIL index > LENGTH OF hexadecimalNumber
     IF hexadecimalNumber(index:1) = SPACE
         EXIT PERFORM
     END-IF
     DISPLAY hexadecimalNumber(index:1) WITH NO ADVANCING
    END-PERFORM.

    DISPLAY " is the hexadecimal equivalent.".

    * End of program
    STOP RUN.

