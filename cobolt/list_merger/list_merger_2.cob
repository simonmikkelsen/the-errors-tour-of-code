IDENTIFICATION DIVISION.
PROGRAM-ID. ListMerger.
AUTHOR. Simon Mikkelsen.

* This program is designed to merge two lists of integers into a single list.
* It reads two lists from the user, merges them, and then displays the merged list.
* The program demonstrates basic COBOL operations such as input/output, array handling,
* and simple loops.

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
01 I PIC 9(4) VALUE 0.
01 J PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter the number of items in the first list: ".
    ACCEPT LIST-1-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     DISPLAY "Enter item " I " for the first list: ".
     ACCEPT LIST-1-ITEMS(I)
    END-PERFORM.

    DISPLAY "Enter the number of items in the second list: ".
    ACCEPT LIST-2-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-2-COUNT
     DISPLAY "Enter item " I " for the second list: ".
     ACCEPT LIST-2-ITEMS(I)
    END-PERFORM.

    MOVE 0 TO I.
    MOVE 0 TO J.
    MOVE 0 TO MERGED-COUNT.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-1-ITEMS(I) TO MERGED-ITEMS(MERGED-COUNT)
    END-PERFORM.

    PERFORM VARYING J FROM 1 BY 1 UNTIL J > LIST-2-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-2-ITEMS(J) TO MERGED-ITEMS(MERGED-COUNT)
    END-PERFORM.

    DISPLAY "The merged list is: ".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > MERGED-COUNT
     DISPLAY MERGED-ITEMS(I)
    END-PERFORM.

    STOP RUN.

