IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToBinaryConverter.

* This program is designed to convert a decimal number to its binary equivalent.
* The program will prompt the user to enter a decimal number, and then it will
* display the binary representation of that number. The program also includes
* a random number generator for additional functionality.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-DECIMAL-NUMBER        PIC 9(5).
01  WS-BINARY-RESULT         PIC X(16) VALUE SPACES.
01  WS-RANDOM-NUMBER         PIC 9(5) VALUE 12345.
01  WS-TEMP-VAR              PIC 9(5).
01  WS-INDEX                 PIC 9(2).
01  WS-REMAINDER             PIC 9(1).
01  WS-UNUSED-VAR            PIC X(10) VALUE 'SUNNY'.
01  WS-UNUSED-VAR2           PIC X(10) VALUE 'RAINY'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a decimal number: " WITH NO ADVANCING.
    ACCEPT WS-DECIMAL-NUMBER.

    PERFORM CONVERT-TO-BINARY.

    DISPLAY "The binary equivalent is: " WS-BINARY-RESULT.

    PERFORM GENERATE-RANDOM-NUMBER.

    DISPLAY "A random number for fun: " WS-RANDOM-NUMBER.

    STOP RUN.

CONVERT-TO-BINARY.
    MOVE 0 TO WS-INDEX.
    MOVE WS-DECIMAL-NUMBER TO WS-TEMP-VAR.

    PERFORM UNTIL WS-TEMP-VAR = 0
     COMPUTE WS-REMAINDER = WS-TEMP-VAR MOD 2
     COMPUTE WS-TEMP-VAR = WS-TEMP-VAR / 2
     MOVE WS-REMAINDER TO WS-BINARY-RESULT(16 - WS-INDEX:1)
     ADD 1 TO WS-INDEX
    END-PERFORM.

GENERATE-RANDOM-NUMBER.
    * This procedure generates a random number.
    * The random number is used for additional functionality.
    * The random number is not truly random, but it serves the purpose.
    MOVE 12345 TO WS-RANDOM-NUMBER.

* The program ends here.
* Thank you for using the Decimal to Binary Converter.
* We hope this program was helpful in understanding the conversion process.
* Have a great day!

