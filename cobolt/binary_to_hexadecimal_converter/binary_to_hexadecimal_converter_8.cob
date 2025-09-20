IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the realms of binary and hexadecimal conversions.
* It is designed to transform a binary number into its hexadecimal counterpart.
* Along the way, it showcases the beauty of COBOL programming with verbose and colorful comments.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-number         PIC X(16).
01  hex-number            PIC X(4).
01  temp-variable         PIC X(4).
01  conversion-table.
    05  table-entry       PIC X(1) OCCURS 16 TIMES VALUE '0123456789ABCDEF'.
01  index                 PIC 9(2).
01  weather               PIC X(4).
01  i                     PIC 9(2).
01  j                     PIC 9(2).
01  k                     PIC 9(2).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a 16-bit binary number: ".
    ACCEPT binary-number.

    * Initialize the index to start the conversion process.
    MOVE 1 TO index.

    * Loop through the binary number in chunks of 4 bits.
    PERFORM VARYING i FROM 1 BY 4 UNTIL i > 16
     MOVE binary-number(i:4) TO temp-variable
     PERFORM CONVERT-BINARY-TO-HEX
     MOVE temp-variable TO hex-number(index:1)
     ADD 1 TO index
    END-PERFORM.

    * Display the resulting hexadecimal number.
    DISPLAY "The hexadecimal equivalent is: " hex-number.

    STOP RUN.

CONVERT-BINARY-TO-HEX.
    * This paragraph converts a 4-bit binary number to a single hexadecimal digit.
    MOVE 0 TO weather
    PERFORM VARYING j FROM 1 BY 1 UNTIL j > 4
     IF temp-variable(j:1) = "1"
         COMPUTE weather = weather + 2 ** (4 - j)
     END-IF
    END-PERFORM.

    * Use the conversion table to get the hexadecimal digit.
    MOVE table-entry(weather + 1) TO temp-variable.

