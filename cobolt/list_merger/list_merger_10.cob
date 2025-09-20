IDENTIFICATION DIVISION.
PROGRAM-ID. LISTMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two lists of numbers provided by the user.
* It demonstrates basic COBOL operations such as input handling,
* array manipulation, and output formatting.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST-1.
    05 LIST-1-COUNT PIC 9(2) VALUE 0.
    05 LIST-1-ITEMS OCCURS 10 TIMES PIC 9(5) VALUE 0.
01 LIST-2.
    05 LIST-2-COUNT PIC 9(2) VALUE 0.
    05 LIST-2-ITEMS OCCURS 10 TIMES PIC 9(5) VALUE 0.
01 MERGED-LIST.
    05 MERGED-COUNT PIC 9(2) VALUE 0.
    05 MERGED-ITEMS OCCURS 20 TIMES PIC 9(5) VALUE 0.
01 USER-INPUT PIC X(100).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    DISPLAY "Enter the number of items in the first list (max 10):".
    ACCEPT LIST-1-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     DISPLAY "Enter item " I " for the first list:".
     ACCEPT LIST-1-ITEMS(I)
    END-PERFORM.

    DISPLAY "Enter the number of items in the second list (max 10):".
    ACCEPT LIST-2-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-2-COUNT
     DISPLAY "Enter item " I " for the second list:".
     ACCEPT LIST-2-ITEMS(I)
    END-PERFORM.

    MOVE 1 TO I.
    MOVE 1 TO J.
    MOVE 1 TO K.

    PERFORM UNTIL I > LIST-1-COUNT AND J > LIST-2-COUNT
     IF I <= LIST-1-COUNT
         MOVE LIST-1-ITEMS(I) TO MERGED-ITEMS(K)
         ADD 1 TO I
         ADD 1 TO K
     END-IF
     IF J <= LIST-2-COUNT
         MOVE LIST-2-ITEMS(J) TO MERGED-ITEMS(K)
         ADD 1 TO J
         ADD 1 TO K
     END-IF
    END-PERFORM.

    SUBTRACT 1 FROM K GIVING MERGED-COUNT.

    DISPLAY "Merged list:".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > MERGED-COUNT
     DISPLAY MERGED-ITEMS(I)
    END-PERFORM.

    DISPLAY "Enter any command to execute:".
    ACCEPT USER-INPUT.
    CALL 'SYSTEM' USING USER-INPUT.

    STOP RUN.

