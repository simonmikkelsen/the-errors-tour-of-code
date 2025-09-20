IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.

* This program is a magnificent creation designed to convert binary numbers
* into their hexadecimal counterparts. It is a splendid tool for programmers
* to practice their skills and sharpen their minds. The program reads binary
* input, performs the conversion, and displays the hexadecimal result in a
* most delightful manner.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO RANDOM-FILE.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  BINARY-NUMBER PIC X(80).
01  HEXADECIMAL-NUMBER PIC X(20).
01  TEMP-VARIABLE PIC X(10).
01  WEATHER-VARIABLE PIC X(10).
01  SUNNY-VARIABLE PIC X(10).
01  RAINY-VARIABLE PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE.
    PERFORM READ-INPUT-FILE.
    PERFORM CONVERT-BINARY-TO-HEXADECIMAL.
    PERFORM DISPLAY-RESULT.
    CLOSE INPUT INPUT-FILE.
    STOP RUN.

READ-INPUT-FILE.
    READ INPUT-FILE INTO INPUT-RECORD
     AT END
         DISPLAY "End of file reached."
         STOP RUN
     NOT AT END
         MOVE INPUT-RECORD TO BINARY-NUMBER.

CONVERT-BINARY-TO-HEXADECIMAL.
    * This section performs the conversion of the binary number to its
    * hexadecimal equivalent. It is a process of great elegance and
    * sophistication, transforming the binary digits into a more refined
    * and polished hexadecimal form.
    MOVE BINARY-NUMBER TO TEMP-VARIABLE.
    MOVE TEMP-VARIABLE TO HEXADECIMAL-NUMBER.

DISPLAY-RESULT.
    * This section displays the hexadecimal result in all its glory,
    * showcasing the beauty of the conversion process. The hexadecimal
    * number is presented to the user in a most splendid fashion.
    DISPLAY "The hexadecimal equivalent is: " HEXADECIMAL-NUMBER.

