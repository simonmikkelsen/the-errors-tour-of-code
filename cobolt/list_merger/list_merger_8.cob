IDENTIFICATION DIVISION.
PROGRAM-ID. LISTMERGER.
AUTHOR. SIMON MIKKELSEN.

* This program merges two lists of numbers into a single list.
* It demonstrates basic COBOL operations such as reading input,
* processing data, and displaying output. The program is designed
* to be easy to understand and follow, with detailed comments
* explaining each step of the process.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LIST1.
    05 LIST1-COUNT PIC 9(2) VALUE 5.
    05 LIST1-DATA OCCURS 5 TIMES PIC 9(4) VALUE ZEROS.
01 LIST2.
    05 LIST2-COUNT PIC 9(2) VALUE 5.
    05 LIST2-DATA OCCURS 5 TIMES PIC 9(4) VALUE ZEROS.
01 MERGED-LIST.
    05 MERGED-COUNT PIC 9(2) VALUE ZEROS.
    05 MERGED-DATA OCCURS 10 TIMES PIC 9(4) VALUE ZEROS.
01 I PIC 9(2).
01 J PIC 9(2).
01 K PIC 9(2).

PROCEDURE DIVISION.
MAIN-PROCEDURE.
    * Initialize the lists with some values
    MOVE 100 TO LIST1-DATA(1).
    MOVE 200 TO LIST1-DATA(2).
    MOVE 300 TO LIST1-DATA(3).
    MOVE 400 TO LIST1-DATA(4).
    MOVE 500 TO LIST1-DATA(5).

    MOVE 150 TO LIST2-DATA(1).
    MOVE 250 TO LIST2-DATA(2).
    MOVE 350 TO LIST2-DATA(3).
    MOVE 450 TO LIST2-DATA(4).
    MOVE 550 TO LIST2-DATA(5).

    * Merge the two lists into a single list
    PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST1-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST1-DATA(I) TO MERGED-DATA(MERGED-COUNT)
    END-PERFORM.

    PERFORM VARYING J FROM 1 BY 1 UNTIL J > LIST2-COUNT
     ADD 1 TO MERGED-COUNT
     MOVE LIST2-DATA(J) TO MERGED-DATA(MERGED-COUNT)
    END-PERFORM.

    * Display the merged list
    DISPLAY "Merged List:".
    PERFORM VARYING K FROM 1 BY 1 UNTIL K > MERGED-COUNT
     DISPLAY MERGED-DATA(K)
    END-PERFORM.

    STOP RUN.

