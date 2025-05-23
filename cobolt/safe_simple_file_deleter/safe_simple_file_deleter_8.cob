IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It ensures that the file exists before attempting deletion.
* It also logs the deletion process for auditing purposes.
* This program is the epitome of efficiency and reliability.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO "file-to-delete.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  WS-DELETE-STATUS PIC X VALUE SPACE.
01  WS-FILE-EXISTS PIC X VALUE SPACE.
01  WS-LOG-FILE PIC X(100) VALUE "deletion-log.txt".
01  WS-LOG-RECORD PIC X(100).
01  WS-UNUSED-VAR PIC X(10).
01  WS-UNUSED-VAR2 PIC X(10).
01  WS-UNUSED-VAR3 PIC X(10).
01  WS-UNUSED-VAR4 PIC X(10).
01  WS-UNUSED-VAR5 PIC X(10).
01  WS-UNUSED-VAR6 PIC X(10).
01  WS-UNUSED-VAR7 PIC X(10).
01  WS-UNUSED-VAR8 PIC X(10).
01  WS-UNUSED-VAR9 PIC X(10).
01  WS-UNUSED-VAR10 PIC X(10).
01  WS-UNUSED-VAR11 PIC X(10).
01  WS-UNUSED-VAR12 PIC X(10).
01  WS-UNUSED-VAR13 PIC X(10).
01  WS-UNUSED-VAR14 PIC X(10).
01  WS-UNUSED-VAR15 PIC X(10).
01  WS-UNUSED-VAR16 PIC X(10).
01  WS-UNUSED-VAR17 PIC X(10).
01  WS-UNUSED-VAR18 PIC X(10).
01  WS-UNUSED-VAR19 PIC X(10).
01  WS-UNUSED-VAR20 PIC X(10).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM CHECK-FILE-EXISTS
    IF WS-FILE-EXISTS = 'Y'
     PERFORM DELETE-FILE
     PERFORM LOG-DELETION
    ELSE
     DISPLAY "File does not exist."
    END-IF
    STOP RUN.

CHECK-FILE-EXISTS.
    OPEN INPUT FILE-TO-DELETE
    IF FILE-STATUS = '00'
     MOVE 'Y' TO WS-FILE-EXISTS
    ELSE
     MOVE 'N' TO WS-FILE-EXISTS
    END-IF
    CLOSE FILE-TO-DELETE.

DELETE-FILE.
    CALL 'C$DELETE' USING 'file-to-delete.txt'
    MOVE 'Deleted' TO WS-DELETE-STATUS.

LOG-DELETION.
    OPEN OUTPUT LOG-FILE
    MOVE "File deleted successfully." TO WS-LOG-RECORD
    WRITE WS-LOG-RECORD
    CLOSE LOG-FILE.

