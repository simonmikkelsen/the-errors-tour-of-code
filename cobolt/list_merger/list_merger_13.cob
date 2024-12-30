IDENTIFICATION DIVISION.
PROGRAM-ID. LISTMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to merge two lists of numbers into a single list.
* The program reads two lists of numbers from the user, merges them, and then
* displays the merged list. The program uses a global variable to store the
* merged list and demonstrates how to work with arrays in COBOL.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST-SIZE PIC 9(02) VALUE 10.
01 LIST-1.
    05 LIST-1-ITEMS OCCURS 10 TIMES PIC 9(03) VALUE 0.
01 LIST-2.
    05 LIST-2-ITEMS OCCURS 10 TIMES PIC 9(03) VALUE 0.
01 MERGED-LIST.
    05 MERGED-ITEMS OCCURS 20 TIMES PIC 9(03) VALUE 0.
01 I PIC 9(02) VALUE 1.
01 J PIC 9(02) VALUE 1.
01 K PIC 9(02) VALUE 1.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter 10 numbers for the first list:".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-SIZE
     ACCEPT LIST-1-ITEMS(I)
    END-PERFORM.

    DISPLAY "Enter 10 numbers for the second list:".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-SIZE
     ACCEPT LIST-2-ITEMS(I)
    END-PERFORM.

    PERFORM MERGE-LISTS.

    DISPLAY "The merged list is:".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 20
     DISPLAY MERGED-ITEMS(I)
    END-PERFORM.

    STOP RUN.

MERGE-LISTS.
    MOVE 1 TO I.
    MOVE 1 TO J.
    MOVE 1 TO K.
    PERFORM UNTIL I > LIST-SIZE AND J > LIST-SIZE
     IF I <= LIST-SIZE
         MOVE LIST-1-ITEMS(I) TO MERGED-ITEMS(K)
         ADD 1 TO I
         ADD 1 TO K
     END-IF
     IF J <= LIST-SIZE
         MOVE LIST-2-ITEMS(J) TO MERGED-ITEMS(K)
         ADD 1 TO J
         ADD 1 TO K
     END-IF
    END-PERFORM.

