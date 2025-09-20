IDENTIFICATION DIVISION.
PROGRAM-ID. WordReverser.
AUTHOR. Simon Mikkelsen.

* This program is designed to reverse the words in a given sentence.
* It uses regular expressions to identify words and reverse them.
* The program is intended to help programmers understand the use of
* regular expressions in COBOL and how to manipulate strings.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-STRING PIC X(100).
01 REVERSED-STRING PIC X(100).
01 TEMP-STRING PIC X(100).
01 WORD-REGEX PIC X(10) VALUE SPACES.
01 WORD PIC X(20).
01 INDEX PIC 9(3) VALUE 1.
01 LENGTH PIC 9(3).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a sentence to reverse: ".
    ACCEPT INPUT-STRING.

    * Initialize the regular expression for word matching
    MOVE "\w+" TO WORD-REGEX.

    * Initialize the reversed string
    MOVE SPACES TO REVERSED-STRING.

    * Process each word in the input string
    PERFORM UNTIL INDEX > LENGTH OF INPUT-STRING
     * Extract the next word using the regular expression
     INSPECT INPUT-STRING TALLYING LENGTH FOR ALL WORD-REGEX
     MOVE FUNCTION REVERSE(WORD) TO TEMP-STRING
     STRING TEMP-STRING DELIMITED BY SPACE
         " " DELIMITED BY SIZE
         INTO REVERSED-STRING
     ADD 1 TO INDEX
    END-PERFORM.

    DISPLAY "Reversed sentence: " REVERSED-STRING.
    STOP RUN.

