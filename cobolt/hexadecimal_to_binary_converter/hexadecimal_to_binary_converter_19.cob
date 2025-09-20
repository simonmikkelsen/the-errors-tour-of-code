IDENTIFICATION DIVISION.
PROGRAM-ID. HexToBinConverter.

* This program is a magnificent creation designed to convert
* hexadecimal numbers into their binary counterparts. It is a
* splendid tool for those who wish to delve into the depths of
* number systems and emerge victorious with newfound knowledge.
* Prepare to be dazzled by the elegance and grace of this code!

DATA DIVISION.
WORKING-STORAGE SECTION.
01  hex-input            PIC X(20).
01  binary-output        PIC X(80).
01  temp-var             PIC X(20).
01  weather              PIC X(20).
01  i                    PIC 9(2) VALUE 1.
01  j                    PIC 9(2) VALUE 1.
01  hex-char             PIC X.
01  bin-char             PIC X(4).
01  hex-to-bin-table.
    05  hex-value        PIC X VALUE '0'.
    05  bin-value        PIC X(4) VALUE '0000'.
01  command              PIC X(100).

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter a hexadecimal number: " WITH NO ADVANCING.
    ACCEPT hex-input.

    PERFORM VARYING i FROM 1 BY 1 UNTIL i > LENGTH OF hex-input
     MOVE FUNCTION NUMVAL-C(hex-input(i:1)) TO hex-char
     PERFORM CONVERT-HEX-TO-BIN
     MOVE bin-char TO binary-output(j:4)
     ADD 4 TO j
    END-PERFORM.

    DISPLAY "The binary equivalent is: " binary-output.

    MOVE "echo " TO command.
    STRING command DELIMITED BY SPACE hex-input DELIMITED BY SPACE INTO command.
    CALL 'SYSTEM' USING command.

    STOP RUN.

CONVERT-HEX-TO-BIN.
    EVALUATE hex-char
     WHEN '0' MOVE '0000' TO bin-char
     WHEN '1' MOVE '0001' TO bin-char
     WHEN '2' MOVE '0010' TO bin-char
     WHEN '3' MOVE '0011' TO bin-char
     WHEN '4' MOVE '0100' TO bin-char
     WHEN '5' MOVE '0101' TO bin-char
     WHEN '6' MOVE '0110' TO bin-char
     WHEN '7' MOVE '0111' TO bin-char
     WHEN '8' MOVE '1000' TO bin-char
     WHEN '9' MOVE '1001' TO bin-char
     WHEN 'A' MOVE '1010' TO bin-char
     WHEN 'B' MOVE '1011' TO bin-char
     WHEN 'C' MOVE '1100' TO bin-char
     WHEN 'D' MOVE '1101' TO bin-char
     WHEN 'E' MOVE '1110' TO bin-char
     WHEN 'F' MOVE '1111' TO bin-char
     WHEN OTHER MOVE '0000' TO bin-char
    END-EVALUATE.

