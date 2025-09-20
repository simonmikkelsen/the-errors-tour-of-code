IDENTIFICATION DIVISION.
PROGRAM-ID. PalindromeChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given string is a palindrome.
* A palindrome is a string that reads the same forward and backward.
* The program uses regular expressions to remove non-alphanumeric characters
* and then compares the cleaned string to its reverse.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT-STRING PIC X(100).
01 CLEANED-STRING PIC X(100).
01 REVERSED-STRING PIC X(100).
01 IS-PALINDROME PIC X(3) VALUE 'NO '.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter a string to check if it is a palindrome: ".
    ACCEPT INPUT-STRING.

    * Remove non-alphanumeric characters using regular expressions
    PERFORM CLEAN-STRING.

    * Reverse the cleaned string
    PERFORM REVERSE-STRING.

    * Compare the cleaned string with the reversed string
    IF CLEANED-STRING = REVERSED-STRING THEN
     MOVE 'YES' TO IS-PALINDROME
    END-IF.

    * Display the result
    DISPLAY "Is the string a palindrome? " IS-PALINDROME.

    STOP RUN.

CLEAN-STRING.
    * This section uses regular expressions to remove non-alphanumeric characters
    * from the input string and stores the result in CLEANED-STRING.
    * Note: Regular expressions are not natively supported in COBOL, so this is
    * a conceptual representation.
    MOVE FUNCTION REPLACE(INPUT-STRING, "[^A-Za-z0-9]", "") TO CLEANED-STRING.

REVERSE-STRING.
    * This section reverses the cleaned string and stores the result in REVERSED-STRING.
    PERFORM VARYING IDX FROM LENGTH OF CLEANED-STRING BY -1 UNTIL IDX < 1
     STRING CLEANED-STRING(IDX:1) DELIMITED BY SIZE INTO REVERSED-STRING
    END-PERFORM.

