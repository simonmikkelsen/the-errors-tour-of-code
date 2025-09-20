IDENTIFICATION DIVISION.
PROGRAM-ID. LISTMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to merge two lists of strings into one.
* It uses regular expressions to filter and validate the input lists.
* The program demonstrates the use of COBOL for text processing and list manipulation.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST-1 PIC X(100) VALUE "apple, banana, cherry".
01 LIST-2 PIC X(100) VALUE "date, fig, grape".
01 MERGED-LIST PIC X(200).
01 TEMP-LIST PIC X(100).
01 REGEX-VALID PIC X(100) VALUE "^[a-zA-Z, ]+$".

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    * Display the initial lists
    DISPLAY "List 1: " LIST-1
    DISPLAY "List 2: " LIST-2

    * Validate the lists using regular expressions
    PERFORM VALIDATE-LIST THRU VALIDATE-LIST-END USING LIST-1
    PERFORM VALIDATE-LIST THRU VALIDATE-LIST-END USING LIST-2

    * Merge the lists
    STRING LIST-1 DELIMITED BY SIZE
        ", " DELIMITED BY SIZE
        LIST-2 DELIMITED BY SIZE
        INTO MERGED-LIST

    * Display the merged list
    DISPLAY "Merged List: " MERGED-LIST

    STOP RUN.

VALIDATE-LIST.
    * Validate the list using regular expressions
    MOVE FUNCTION REVERSE(WS-LIST) TO TEMP-LIST
    IF FUNCTION NUMVAL-C(REGEX-VALID) = 0
     DISPLAY "Invalid list format: " WS-LIST
     STOP RUN
    END-IF.
VALIDATE-LIST-END.

* End of program
