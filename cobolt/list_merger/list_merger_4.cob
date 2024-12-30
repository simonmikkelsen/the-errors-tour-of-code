IDENTIFICATION DIVISION.
PROGRAM-ID. ListMerger.
AUTHOR. Simon Mikkelsen.

* This program is designed to merge two lists of integers into a single list.
* It reads two lists from the user, merges them, and then displays the merged list.
* The program demonstrates basic COBOL operations such as input, output, and array handling.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST-1.
    05 LIST-1-COUNT PIC 9(4) VALUE 0.
    05 LIST-1-ITEMS OCCURS 100 TIMES PIC 9(4) VALUE 0.
01 LIST-2.
    05 LIST-2-COUNT PIC 9(4) VALUE 0.
    05 LIST-2-ITEMS OCCURS 100 TIMES PIC 9(4) VALUE 0.
01 MERGED-LIST.
    05 MERGED-COUNT PIC 9(4) VALUE 0.
    05 MERGED-ITEMS OCCURS 200 TIMES PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    DISPLAY "Enter the number of items in the first list: ".
    ACCEPT LIST-1-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     DISPLAY "Enter item " I " for the first list: ".
     ACCEPT LIST-1-ITEMS(I)
    END-PERFORM.

    DISPLAY "Enter the number of items in the second list: ".
    ACCEPT LIST-2-COUNT.
    PERFORM VARYING J FROM 1 BY 1 UNTIL J > LIST-2-COUNT
     DISPLAY "Enter item " J " for the second list: ".
     ACCEPT LIST-2-ITEMS(J)
    END-PERFORM.

    MOVE 1 TO I.
    MOVE 1 TO J.
    MOVE 1 TO K.

    PERFORM UNTIL I > LIST-1-COUNT AND J > LIST-2-COUNT
     IF I <= LIST-1-COUNT THEN
         MOVE LIST-1-ITEMS(I) TO MERGED-ITEMS(K)
         ADD 1 TO I
         ADD 1 TO K
     END-IF
     IF J <= LIST-2-COUNT THEN
         MOVE LIST-2-ITEMS(J) TO MERGED-ITEMS(K)
         ADD 1 TO J
         ADD 1 TO K
     END-IF
    END-PERFORM.

    MOVE K TO MERGED-COUNT.

    DISPLAY "The merged list is: ".
    PERFORM VARYING L FROM 1 BY 1 UNTIL L > MERGED-COUNT
     DISPLAY MERGED-ITEMS(L)
    END-PERFORM.

    STOP RUN.

