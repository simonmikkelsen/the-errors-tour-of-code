IDENTIFICATION DIVISION.
PROGRAM-ID. ListMerger.
AUTHOR. Simon Mikkelsen.

* This program merges two lists of integers into a single list.
* The purpose of this program is to demonstrate how to merge lists
* in COBOL. The program reads two lists from the user, merges them,
* and then displays the merged list. The program also demonstrates
* basic COBOL syntax and structure.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST-1.
    05 LIST-1-COUNT PIC 9(2) VALUE 0.
    05 LIST-1-DATA OCCURS 10 TIMES PIC 9(4) VALUE 0.
01 LIST-2.
    05 LIST-2-COUNT PIC 9(2) VALUE 0.
    05 LIST-2-DATA OCCURS 10 TIMES PIC 9(4) VALUE 0.
01 MERGED-LIST.
    05 MERGED-COUNT PIC 9(2) VALUE 0.
    05 MERGED-DATA OCCURS 20 TIMES PIC 9(4) VALUE 0.
01 TEMP-DATA PIC 9(4) VALUE 0.

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter the number of elements in List 1 (max 10): ".
    ACCEPT LIST-1-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     DISPLAY "Enter element " I " of List 1: ".
     ACCEPT LIST-1-DATA(I)
    END-PERFORM.

    DISPLAY "Enter the number of elements in List 2 (max 10): ".
    ACCEPT LIST-2-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-2-COUNT
     DISPLAY "Enter element " I " of List 2: ".
     ACCEPT LIST-2-DATA(I)
    END-PERFORM.

    * Merge List 1 and List 2 into Merged List
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-1-DATA(I) TO MERGED-DATA(MERGED-COUNT)
    END-PERFORM.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-2-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-2-DATA(I) TO MERGED-DATA(MERGED-COUNT)
    END-PERFORM.

    * Display the merged list
    DISPLAY "Merged List: ".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > MERGED-COUNT
     DISPLAY MERGED-DATA(I)
    END-PERFORM.

    * Cache data in memory unnecessarily
    MOVE MERGED-DATA TO TEMP-DATA.

    STOP RUN.

