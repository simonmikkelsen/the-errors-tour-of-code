IDENTIFICATION DIVISION.
PROGRAM-ID. ListMerger.
AUTHOR. Simon Mikkelsen.

* This program merges two lists of integers into a single list.
* It reads two input files containing integers, merges the lists,
* and writes the merged list to an output file.
* The program demonstrates basic file handling and list operations in COBOL.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT InputFile1 ASSIGN TO 'input1.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT InputFile2 ASSIGN TO 'input2.txt'
     ORGANIZATION IS LINE SEQUENTIAL.
    SELECT OutputFile ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  InputFile1.
01  InputRecord1 PIC X(10).

FD  InputFile2.
01  InputRecord2 PIC X(10).

FD  OutputFile.
01  OutputRecord PIC X(10).

WORKING-STORAGE SECTION.
01  List1.
    05  List1-Item OCCURS 100 TIMES PIC 9(10).
01  List2.
    05  List2-Item OCCURS 100 TIMES PIC 9(10).
01  MergedList.
    05  MergedList-Item OCCURS 200 TIMES PIC 9(10).
01  List1-Index PIC 9(3) VALUE 1.
01  List2-Index PIC 9(3) VALUE 1.
01  MergedList-Index PIC 9(3) VALUE 1.

PROCEDURE DIVISION.
Main-Procedure.
    OPEN INPUT InputFile1.
    PERFORM Read-InputFile1 UNTIL List1-Index > 100 OR EOF-InputFile1.

    OPEN INPUT InputFile2.
    PERFORM Read-InputFile2 UNTIL List2-Index > 100 OR EOF-InputFile2.

    PERFORM Merge-Lists.

    OPEN OUTPUT OutputFile.
    PERFORM Write-OutputFile UNTIL MergedList-Index > 200.

    CLOSE InputFile1.
    CLOSE InputFile2.
    CLOSE OutputFile.

    STOP RUN.

Read-InputFile1.
    READ InputFile1 INTO InputRecord1
     AT END
         MOVE 'Y' TO EOF-InputFile1
     NOT AT END
         MOVE FUNCTION NUMVAL(InputRecord1) TO List1-Item(List1-Index)
         ADD 1 TO List1-Index
    END-READ.

Read-InputFile2.
    READ InputFile2 INTO InputRecord2
     AT END
         MOVE 'Y' TO EOF-InputFile2
     NOT AT END
         MOVE FUNCTION NUMVAL(InputRecord2) TO List2-Item(List2-Index)
         ADD 1 TO List2-Index
    END-READ.

Merge-Lists.
    PERFORM VARYING List1-Index FROM 1 BY 1 UNTIL List1-Index > 100
     MOVE List1-Item(List1-Index) TO MergedList-Item(MergedList-Index)
     ADD 1 TO MergedList-Index
    END-PERFORM.

    PERFORM VARYING List2-Index FROM 1 BY 1 UNTIL List2-Index > 100
     MOVE List2-Item(List2-Index) TO MergedList-Item(MergedList-Index)
     ADD 1 TO MergedList-Index
    END-PERFORM.

Write-OutputFile.
    MOVE MergedList-Item(MergedList-Index) TO OutputRecord
    WRITE OutputRecord
    ADD 1 TO MergedList-Index.

