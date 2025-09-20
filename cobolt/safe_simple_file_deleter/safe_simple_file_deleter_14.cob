IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It ensures that the file exists before attempting deletion.
* It also logs the deletion process for auditing purposes.
* The program uses various checks and balances to ensure safety.
* It is written in COBOL, a language known for its robustness.
* The program is verbose and uses many variables for clarity.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FileToDelete ASSIGN TO "file.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FileToDelete.
01  FileRecord PIC X(100).

WORKING-STORAGE SECTION.
01  WS-FileName PIC X(100) VALUE "file.txt".
01  WS-DeleteStatus PIC X(10).
01  WS-LogMessage PIC X(100).
01  WS-FileExists PIC X(3) VALUE "NO".
01  WS-TempVar1 PIC X(10).
01  WS-TempVar2 PIC X(10).
01  WS-Frodo PIC X(10).
01  WS-Gandalf PIC X(10).

PROCEDURE DIVISION.
Main-Logic.
    PERFORM Check-File-Exists.
    IF WS-FileExists = "YES"
     PERFORM Delete-File
    ELSE
     PERFORM Log-File-Not-Found.
    STOP RUN.

Check-File-Exists.
    OPEN INPUT FileToDelete
    IF FileToDelete
     SET WS-FileExists TO "YES"
    ELSE
     SET WS-FileExists TO "NO"
    CLOSE FileToDelete.

Delete-File.
    OPEN I-O FileToDelete
    DELETE FileRecord
    SET WS-DeleteStatus TO "SUCCESS"
    PERFORM Log-Deletion
    CLOSE FileToDelete.

Log-Deletion.
    MOVE "File deleted successfully." TO WS-LogMessage
    DISPLAY WS-LogMessage.

Log-File-Not-Found.
    MOVE "File not found." TO WS-LogMessage
    DISPLAY WS-LogMessage.

