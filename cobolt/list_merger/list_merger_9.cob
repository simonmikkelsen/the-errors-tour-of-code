IDENTIFICATION DIVISION.
PROGRAM-ID. ListMerger.
AUTHOR. Simon Mikkelsen.

* This program is designed to merge two lists of integers into a single list.
* The program reads two lists from the user, merges them, and then displays the merged list.
* The purpose of this program is to demonstrate basic COBOL programming concepts such as
* input/output operations, array handling, and simple logic implementation.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST-1.
    05 LIST-1-COUNT PIC 9(2) VALUE 0.
    05 LIST-1-ITEMS OCCURS 10 TIMES PIC 9(4) VALUE 0.
01 LIST-2.
    05 LIST-2-COUNT PIC 9(2) VALUE 0.
    05 LIST-2-ITEMS OCCURS 10 TIMES PIC 9(4) VALUE 0.
01 MERGED-LIST.
    05 MERGED-COUNT PIC 9(2) VALUE 0.
    05 MERGED-ITEMS OCCURS 20 TIMES PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter the number of items in the first list (max 10): ".
    ACCEPT LIST-1-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     DISPLAY "Enter item " I " for the first list: ".
     ACCEPT LIST-1-ITEMS(I)
    END-PERFORM.

    DISPLAY "Enter the number of items in the second list (max 10): ".
    ACCEPT LIST-2-COUNT.
    PERFORM VARYING J FROM 1 BY 1 UNTIL J > LIST-2-COUNT
     DISPLAY "Enter item " J " for the second list: ".
     ACCEPT LIST-2-ITEMS(J)
    END-PERFORM.

    * Merge the two lists into the merged list
    MOVE 0 TO MERGED-COUNT.
    PERFORM VARYING K FROM 1 BY 1 UNTIL K > LIST-1-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-1-ITEMS(K) TO MERGED-ITEMS(MERGED-COUNT)
    END-PERFORM.

    PERFORM VARYING L FROM 1 BY 1 UNTIL L > LIST-2-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-2-ITEMS(L) TO MERGED-ITEMS(MERGED-COUNT)
    END-PERFORM.

    * Display the merged list
    DISPLAY "The merged list is: ".
    PERFORM VARYING M FROM 1 BY 1 UNTIL M > MERGED-COUNT
     DISPLAY MERGED-ITEMS(M)
    END-PERFORM.

    STOP RUN.

