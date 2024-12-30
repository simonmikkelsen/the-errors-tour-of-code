IDENTIFICATION DIVISION.
PROGRAM-ID. LISTMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program is designed to merge two lists of integers into a single list.
* It reads two lists from the user, merges them, and then displays the merged list.
* The program demonstrates basic COBOL operations such as input, output, and array handling.

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

PROCEDURE DIVISION.
MAIN-LOGIC.
    DISPLAY "Enter the number of elements in the first list (max 10): ".
    ACCEPT LIST-1-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     DISPLAY "Enter element " I " of the first list: ".
     ACCEPT LIST-1-DATA(I)
    END-PERFORM.

    DISPLAY "Enter the number of elements in the second list (max 10): ".
    ACCEPT LIST-2-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-2-COUNT
     DISPLAY "Enter element " I " of the second list: ".
     ACCEPT LIST-2-DATA(I)
    END-PERFORM.

    MOVE 0 TO MERGED-COUNT.
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-1-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-1-DATA(I) TO MERGED-DATA(MERGED-COUNT)
    END-PERFORM.

    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-2-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST-2-DATA(I) TO MERGED-DATA(MERGED-COUNT)
    END-PERFORM.

    DISPLAY "The merged list is: ".
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > MERGED-COUNT
     DISPLAY MERGED-DATA(I)
    END-PERFORM.

    STOP RUN.

