IDENTIFICATION DIVISION.
PROGRAM-ID. PrimeNumberChecker.
AUTHOR. Simon Mikkelsen.

* This program checks if a given number is a prime number.
* A prime number is a natural number greater than 1 that has no
* positive divisors other than 1 and itself.
* The program will prompt the user to enter a number and then
* determine if the number is prime or not.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT INPUT-FILE ASSIGN TO 'INPUT.DAT'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  INPUT-FILE.
01  INPUT-RECORD PIC X(80).

WORKING-STORAGE SECTION.
01  WS-NUMBER PIC 9(10) VALUE 0.
01  WS-INDEX PIC 9(10) VALUE 2.
01  WS-IS-PRIME PIC X VALUE 'Y'.
01  WS-END-OF-FILE PIC X VALUE 'N'.

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    OPEN INPUT INPUT-FILE
    PERFORM UNTIL WS-END-OF-FILE = 'Y'
     READ INPUT-FILE INTO INPUT-RECORD
         AT END
          MOVE 'Y' TO WS-END-OF-FILE
         NOT AT END
          MOVE FUNCTION NUMVAL(INPUT-RECORD) TO WS-NUMBER
          PERFORM CHECK-PRIME
          DISPLAY 'Number: ' WS-NUMBER
          DISPLAY 'Is Prime: ' WS-IS-PRIME
     END-READ
    END