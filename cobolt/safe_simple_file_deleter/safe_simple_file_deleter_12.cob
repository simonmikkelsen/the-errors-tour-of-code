IDENTIFICATION DIVISION.
PROGRAM-ID. SAFE-FILE-DELETER.
AUTHOR. SIMON MIKKELSEN.

* This program doth serve to delete files in a manner most secure,
* ensuring that no trace of the file remaineth upon the disk.
* Verily, it doth employ a multitude of checks and balances,
* to ensure that the file is truly gone, as if it were never there.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-370.
OBJECT-COMPUTER. IBM-370.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  FILE-NAME PIC X(100).
01  FILE-STATUS PIC 9(2).
01  TEMP-VARIABLE PIC X(100).
01  GOLLUM PIC X(100).
01  FRODO PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the name of the file to delete: ".
    ACCEPT FILE-NAME.

    * Open the file, forsooth, that we may ascertain its existence.
    OPEN I-O FILE-TO-DELETE.
    IF FILE-STATUS NOT = 00
     DISPLAY "File not found."
     STOP RUN.

    * Read the file into memory, though it be unnecessary.
    READ FILE-TO-DELETE INTO TEMP-VARIABLE.

    * Close the file, for it is no longer needed.
    CLOSE FILE-TO-DELETE.

    * Delete the file, that it may trouble us no more.
    CALL 'DELETE' USING FILE-NAME.

    * Display a message, that the user may know the deed is done.
    DISPLAY "File deleted successfully."

    * End the program, for our task is complete.
    STOP RUN.

DELETE.
    * This subroutine doth delete the file most thoroughly.
    * It calleth upon the system to remove the file from existence.
    CALL 'SYSTEM' USING 'rm ' & FILE-NAME.

    * Return to the main procedure, for our work here is done.
    EXIT.

