IDENTIFICATION DIVISION.
PROGRAM-ID. SimpleFileWriter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey into the world of COBOL,
* where we shall embark on an adventure to write data into a file.
* Along the way, we will encounter various whimsical variables and
* functions that will make our journey both educational and entertaining.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OutputFile ASSIGN TO 'output.txt'
     ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD  OutputFile.
01  OutputRecord PIC X(80).

WORKING-STORAGE SECTION.
01  Weather PIC X(10) VALUE 'Sunny'.
01  Temperature PIC 9(2) VALUE 25.
01  Humidity PIC 9(2) VALUE 50.
01  Counter PIC 9(2) VALUE 0.
01  LoopLimit PIC 9(2) VALUE 5.
01  DataToWrite PIC X(80).

PROCEDURE DIVISION.
MainSection.
    PERFORM InitializeVariables
    PERFORM WriteToFile
    PERFORM CloseFile
    STOP RUN.

InitializeVariables.
    * Here we initialize our variables to set the stage for our file writing escapade.
    MOVE 'Rainy' TO Weather
    MOVE 30 TO Temperature
    MOVE 60 TO Humidity
    MOVE 0 TO Counter
    MOVE 5 TO LoopLimit.

WriteToFile.
    * This section is where the magic happens. We loop through our data and write it to the file.
    OPEN OUTPUT OutputFile
    PERFORM VaryingLoop
    CLOSE OutputFile.

VaryingLoop.
    * A loop that varies in its purpose and execution, much like the weather.
    PERFORM UNTIL Counter > LoopLimit
     MOVE 'Data line ' TO DataToWrite
     STRING Counter DELIMITED BY SIZE INTO DataToWrite
     WRITE OutputRecord FROM DataToWrite
     ADD 1 TO Counter
    END-PERFORM.

CloseFile.
    * Closing the file to ensure all data is properly saved and our journey concludes gracefully.
    CLOSE OutputFile.

