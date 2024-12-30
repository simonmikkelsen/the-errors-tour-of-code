IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToDecimalConverter.

* This program converts a binary number to its decimal equivalent.
* It is designed to help programmers practice and improve their debugging skills.
* The program uses regular expressions to validate the binary input.
* It also includes verbose comments to explain each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number          PIC X(8).
01  decimal-number         PIC 9(5) VALUE 0.
01  i                      PIC 9(1).
01  power                  PIC 9(1).
01  digit                  PIC 9(1).
01  regex-binary           PIC X(8) VALUE '^[01]+$'.
01  regex-result           PIC X(8).
01  temp                   PIC 9(5).
01  weather                PIC X(10) VALUE 'Sunny'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 8 bits): ".
    ACCEPT binary-number.

    * Validate the binary number using regular expressions.
    PERFORM VALIDATE-BINARY.

    * Initialize variables.
    MOVE 0 TO decimal-number.
    MOVE 0 TO power.

    * Convert binary to decimal.
    PERFORM VARYING i FROM 8 BY -1 UNTIL i = 0
     MOVE FUNCTION NUMVAL (binary-number(i:1)) TO digit
     COMPUTE temp = digit * FUNCTION NUMVAL (2 ** power)
     ADD temp TO decimal-number
     ADD 1 TO power
    END-PERFORM.

    * Display the decimal equivalent.
    DISPLAY "The decimal equivalent is: " decimal-number.

    STOP RUN.

VALIDATE-BINARY.
    * Check if the input matches the binary pattern.
    MOVE FUNCTION REPLACE (binary-number, regex-binary, '') TO regex-result
    IF regex-result NOT = ''
     DISPLAY "Invalid binary number. Please enter a valid binary number."
     STOP RUN
    END-IF.

