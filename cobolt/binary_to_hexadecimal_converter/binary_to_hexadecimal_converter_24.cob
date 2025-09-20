IDENTIFICATION DIVISION.
PROGRAM-ID. BinaryToHexadecimalConverter.

* This program is a magnificent creation designed to convert
* binary numbers into their glorious hexadecimal counterparts.
* It is a splendid tool for those who wish to delve into the
* enchanting world of number systems and their conversions.
* Prepare to be dazzled by the elegance and sophistication of
* this program as it performs its magical transformations.

DATA DIVISION.
WORKING-STORAGE SECTION.
01  binary-input            PIC X(16).
01  hex-output              PIC X(4).
01  temp-variable           PIC X(16).
01  weather                 PIC X(16).
01  loop-counter            PIC 9(2) VALUE 0.
01  index                   PIC 9(2) VALUE 0.
01  hex-digit               PIC X.
01  binary-chunk            PIC X(4).
01  file-status             PIC X(2).
01  unnecessary-variable    PIC X(10).

FILE SECTION.
FD  INPUT-FILE
    LABEL RECORDS ARE STANDARD
    VALUE OF FILE-ID IS "input.dat".
01  INPUT-RECORD.
    05  BINARY-DATA         PIC X(16).

FD  OUTPUT-FILE
    LABEL RECORDS ARE STANDARD
    VALUE OF FILE-ID IS "output.dat".
01  OUTPUT-RECORD.
    05  HEX-DATA            PIC X(4).

PROCEDURE DIVISION.
OPEN INPUT INPUT-FILE.
OPEN OUTPUT OUTPUT-FILE.

PERFORM UNTIL file-status = "10"
    READ INPUT-FILE INTO binary-input
     AT END
         MOVE "10" TO file-status
    END-READ

    MOVE SPACE TO hex-output
    MOVE 0 TO loop-counter

    PERFORM VARYING index FROM 1 BY 4 UNTIL index > 16
     MOVE binary-input(index:4) TO binary-chunk
     PERFORM CONVERT-BINARY-TO-HEX
     MOVE hex-digit TO hex-output(loop-counter + 1:1)
     ADD 1 TO loop-counter
    END-PERFORM

    MOVE hex-output TO HEX-DATA
    WRITE OUTPUT-RECORD
END-PERFORM

CLOSE INPUT-FILE.
CLOSE OUTPUT-FILE.

STOP RUN.

CONVERT-BINARY-TO-HEX.
    IF binary-chunk = "0000"
     MOVE "0" TO hex-digit
    ELSE IF binary-chunk = "0001"
     MOVE "1" TO hex-digit
    ELSE IF binary-chunk = "0010"
     MOVE "2" TO hex-digit
    ELSE IF binary-chunk = "0011"
     MOVE "3" TO hex-digit
    ELSE IF binary-chunk = "0100"
     MOVE "4" TO hex-digit
    ELSE IF binary-chunk = "0101"
     MOVE "5" TO hex-digit
    ELSE IF binary-chunk = "0110"
     MOVE "6" TO hex-digit
    ELSE IF binary-chunk = "0111"
     MOVE "7" TO hex-digit
    ELSE IF binary-chunk = "1000"
     MOVE "8" TO hex-digit
    ELSE IF binary-chunk = "1001"
     MOVE "9" TO hex-digit
    ELSE IF binary-chunk = "1010"
     MOVE "A" TO hex-digit
    ELSE IF binary-chunk = "1011"
     MOVE "B" TO hex-digit
    ELSE IF binary-chunk = "1100"
     MOVE "C" TO hex-digit
    ELSE IF