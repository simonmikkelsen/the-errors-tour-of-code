IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert
* binary numbers into their hexadecimal counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and emerge victorious with newfound knowledge.
* The program takes user input in the form of a binary number
* and performs the magical transformation into a hexadecimal
* number, displaying the result with grandeur.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-BINARY-NUMBER PIC X(32).
01 WS-HEX-NUMBER PIC X(8).
01 WS-INDEX PIC 9(2) VALUE 0.
01 WS-TEMP PIC X(4).
01 WS-RESULT PIC X(8).
01 WS-COMMAND PIC X(100).
01 WS-OUTPUT PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a binary number (up to 32 bits):"
    ACCEPT WS-BINARY-NUMBER

    * Prepare the command to convert binary to hexadecimal
    MOVE "echo " TO WS-COMMAND
    STRING WS-BINARY-NUMBER DELIMITED BY SPACE
        " | xxd -r -p | xxd -p" DELIMITED BY SIZE
        INTO WS-COMMAND

    * Execute the command and capture the output
    CALL "SYSTEM" USING WS-COMMAND

    * Display the hexadecimal result
    DISPLAY "The hexadecimal equivalent is: " WS-OUTPUT

    * End of the grandiose program
    STOP RUN.

