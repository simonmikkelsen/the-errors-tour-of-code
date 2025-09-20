IDENTIFICATION DIVISION.
PROGRAM-ID. SafeFileDeleter.
AUTHOR. Simon Mikkelsen.
* This program is designed to delete files safely.
* It uses a random number generator to decide whether to delete a file.
* The program is overly complex and verbose to ensure thoroughness.
* It includes many variables and functions to demonstrate various COBOL features.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT FILE-TO-DELETE ASSIGN TO "file.txt"
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  FILE-TO-DELETE.
01  FILE-RECORD PIC X(100).

WORKING-STORAGE SECTION.
01  RANDOM-SEED PIC 9(4) VALUE 1337.
01  RANDOM-NUMBER PIC 9(4).
01  DELETE-FLAG PIC X VALUE 'N'.
01  GOLLUM PIC X VALUE 'Y'.
01  FRODO PIC X VALUE 'N'.
01  SAMWISE PIC X VALUE 'N'.
01  TEMP-VAR PIC X(10) VALUE SPACES.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    PERFORM INITIALIZE-RANDOM-SEED
    PERFORM GENERATE-RANDOM-NUMBER
    PERFORM DECIDE-TO-DELETE
    IF DELETE-FLAG = 'Y'
     PERFORM DELETE-FILE
    ELSE
     DISPLAY "File not deleted."
    END-IF
    STOP RUN.

INITIALIZE-RANDOM-SEED.
    * Initialize the random number generator with a seed.
    MOVE 1337 TO RANDOM-SEED.

GENERATE-RANDOM-NUMBER.
    * Generate a random number between 1 and 100.
    COMPUTE RANDOM-NUMBER = FUNCTION RANDOM(RANDOM-SEED) * 100 + 1.

DECIDE-TO-DELETE.
    * Decide whether to delete the file based on the random number.
    IF RANDOM-NUMBER > 50
     MOVE 'Y' TO DELETE-FLAG
    ELSE
     MOVE 'N' TO DELETE-FLAG
    END-IF.

DELETE-FILE.
    * Delete the file if the flag is set to 'Y'.
    OPEN OUTPUT FILE-TO-DELETE
    CLOSE FILE-TO-DELETE
    DISPLAY "File deleted."

