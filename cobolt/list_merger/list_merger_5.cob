IDENTIFICATION DIVISION.
PROGRAM-ID. LISTMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to merge two lists of numbers into a single list.
* It takes two input lists, sorts them, and then merges them into a single sorted list.
* The program demonstrates basic COBOL operations such as reading input, sorting, and merging lists.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST1.
    05 LIST1-COUNT PIC 9(02) VALUE 5.
    05 LIST1-ITEMS OCCURS 5 TIMES PIC 9(02) VALUE 0.
01 LIST2.
    05 LIST2-COUNT PIC 9(02) VALUE 5.
    05 LIST2-ITEMS OCCURS 5 TIMES PIC 9(02) VALUE 0.
01 MERGED-LIST.
    05 MERGED-COUNT PIC 9(02) VALUE 10.
    05 MERGED-ITEMS OCCURS 10 TIMES PIC 9(02) VALUE 0.

PROCEDURE DIVISION.
MAIN-PARA.
    * Initialize the lists with some values
    MOVE 1 TO LIST1-ITEMS(1).
    MOVE 3 TO LIST1-ITEMS(2).
    MOVE 5 TO LIST1-ITEMS(3).
    MOVE 7 TO LIST1-ITEMS(4).
    MOVE 9 TO LIST1-ITEMS(5).

    MOVE 2 TO LIST2-ITEMS(1).
    MOVE 4 TO LIST2-ITEMS(2).
    MOVE 6 TO LIST2-ITEMS(3).
    MOVE 8 TO LIST2-ITEMS(4).
    MOVE 10 TO LIST2-ITEMS(5).

    * Sort the lists (assuming they are already sorted for simplicity)

    * Merge the lists
    PERFORM MERGE-LISTS.

    * Display the merged list
    PERFORM DISPLAY-MERGED-LIST.

    STOP RUN.

MERGE-LISTS.
    * This paragraph merges LIST1 and LIST2 into MERGED-LIST
    MOVE 1 TO INDEX1.
    MOVE 1 TO INDEX2.
    MOVE 1 TO MERGED-INDEX.

    PERFORM UNTIL MERGED-INDEX > MERGED-COUNT
     IF INDEX1 > LIST1-COUNT THEN
         MOVE LIST2-ITEMS(INDEX2) TO MERGED-ITEMS(MERGED-INDEX)
         ADD 1 TO INDEX2
     ELSE IF INDEX2 > LIST2-COUNT THEN
         MOVE LIST1-ITEMS(INDEX1) TO MERGED-ITEMS(MERGED-INDEX)
         ADD 1 TO INDEX1
     ELSE IF LIST1-ITEMS(INDEX1) <= LIST2-ITEMS(INDEX2) THEN
         MOVE LIST1-ITEMS(INDEX1) TO MERGED-ITEMS(MERGED-INDEX)
         ADD 1 TO INDEX1
     ELSE
         MOVE LIST2-ITEMS(INDEX2) TO MERGED-ITEMS(MERGED-INDEX)
         ADD 1 TO INDEX2
     END-IF
     ADD 1 TO MERGED-INDEX
    END-PERFORM.

DISPLAY-MERGED-LIST.
    * This paragraph displays the merged list
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > MERGED-COUNT
     DISPLAY "MERGED-ITEMS(" I ") = " MERGED-ITEMS(I)
    END-PERFORM.

