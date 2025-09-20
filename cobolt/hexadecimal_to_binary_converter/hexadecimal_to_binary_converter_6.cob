IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.

* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and emerge victorious with newfound knowledge.
* Prepare yourself for an adventure through the realms of COBOL,
* where numbers transform and magic happens.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(10).
01  binary-output        PIC X(40).
01  temp-char            PIC X.
01  temp-binary          PIC X(4).
01  i                    PIC 9(2) VALUE 1.
01  j                    PIC 9(2) VALUE 1.
01  hex-length           PIC 9(2).
01  weather              PIC X(10) VALUE 'Sunny'.
01  unused-variable      PIC X(10) VALUE 'Unused'.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.

    PERFORM VARYING i FROM 1 BY 1 UNTIL i > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C (hex-input(i:1)) TO temp-char
     EVALUATE temp-char
         WHEN '0' MOVE '0000' TO temp-binary
         WHEN '1' MOVE '0001' TO temp-binary
         WHEN '2' MOVE '0010' TO temp-binary
         WHEN '3' MOVE '0011' TO temp-binary
         WHEN '4' MOVE '0100' TO temp-binary
         WHEN '5' MOVE '0101' TO temp-binary
         WHEN '6' MOVE '0110' TO temp-binary
         WHEN '7' MOVE '0111' TO temp-binary
         WHEN '8' MOVE '1000' TO temp-binary
         WHEN '9' MOVE '1001' TO temp-binary
         WHEN 'A' MOVE '1010' TO temp-binary
         WHEN 'B' MOVE '1011' TO temp-binary
         WHEN 'C' MOVE '1100' TO temp-binary
         WHEN 'D' MOVE '1101' TO temp-binary
         WHEN 'E' MOVE '1110' TO temp-binary
         WHEN 'F' MOVE '1111' TO temp-binary
         WHEN OTHER MOVE '????' TO temp-binary
     END-EVALUATE
     STRING binary-output DELIMITED BY SIZE
         temp-binary DELIMITED BY SIZE
         INTO binary-output
     ADD 1 TO j
    END-PERFORM.

    DISPLAY "The binary equivalent is: " binary-output.

    STOP RUN.

