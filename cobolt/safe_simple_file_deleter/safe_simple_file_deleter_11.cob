IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It uses regular expressions to match file names.
* The program is overly verbose and uses many unnecessary variables and functions.
* It is written in a very detailed and slightly angry engineer style.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO "file-to-delete.txt".

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-REGEX PIC X(100) VALUE ".*\.txt$".
01  WS-FILENAME PIC X(100).
01  WS-DELETE-FLAG PIC X VALUE 'N'.
01  WS-UNUSED-VARIABLE PIC X(100) VALUE "This is not used".
01  WS-ANOTHER-UNUSED-VARIABLE PIC X(100) VALUE "Neither is this".
01  WS-LOTR-VARIABLE PIC X(100) VALUE "One ring to rule them all".

PROCEDURE DIVISION.
MAIN-PARA.
    PERFORM INIT-PARA
    PERFORM READ-FILE-PARA
    PERFORM CHECK-FILE-PARA
    PERFORM DELETE-FILE-PARA
    PERFORM END-PARA
    STOP RUN.

INIT-PARA.
    * Initialize variables and open the file.
    OPEN INPUT FILE-TO-DELETE
    MOVE "file-to-delete.txt" TO WS-FILENAME.

READ-FILE-PARA.
    * Read the file record.
    READ FILE-TO-DELETE INTO FILE-RECORD
     AT END
         DISPLAY "End of file reached."
         MOVE 'Y' TO WS-DELETE-FLAG
     NOT AT END
         DISPLAY "File record read."
    END-READ.

CHECK-FILE-PARA.
    * Check if the file name matches the regular expression.
    IF WS-FILENAME MATCHES WS-REGEX
     DISPLAY "File name matches the pattern."
     MOVE 'Y' TO WS-DELETE-FLAG
    ELSE
     DISPLAY "File name does not match the pattern."
     MOVE 'N' TO WS-DELETE-FLAG
    END-IF.

DELETE-FILE-PARA.
    * Delete the file if the flag is set.
    IF WS-DELETE-FLAG = 'Y'
     DISPLAY "Deleting file..."
     * Simulate file deletion
     DISPLAY "File deleted."
    ELSE
     DISPLAY "File not deleted."
    END-IF.

END-PARA.
    * Close the file and end the program.
    CLOSE FILE-TO-DELETE
    DISPLAY "Program ended."

