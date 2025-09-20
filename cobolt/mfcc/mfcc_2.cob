IDENTIFICATION DIVISION.
PROGRAM-ID. mfcc.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of COBOL,
* designed to enchant and educate with its whimsical logic and
* charming variables. It is a labor of love, crafted to bring joy
* and knowledge to all who read it.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Frodo PIC X(10) VALUE 'Baggins'.
01 Sam PIC X(10) VALUE 'Gamgee'.
01 Gandalf PIC X(10) VALUE 'Grey'.
01 Aragorn PIC X(10) VALUE 'Strider'.
01 Legolas PIC X(10) VALUE 'Greenleaf'.
01 Gimli PIC X(10) VALUE 'Son of Gloin'.
01 Boromir PIC X(10) VALUE 'Steward'.
01 TheRing PIC X(1) VALUE '1'.
01 MemoryPointer POINTER.
01 MemoryBlock PIC X(100).

PROCEDURE DIVISION.
MainSection.
    DISPLAY "Welcome to the enchanting world of COBOL!".
    PERFORM AllocateMemory.
    PERFORM UseMemory.
    PERFORM ReleaseMemory.
    DISPLAY "Thank you for visiting our magical program.".
    STOP RUN.

AllocateMemory.
    * In this section, we shall allocate a block of memory
    * to store our precious data. This is akin to Frodo
    * embarking on his quest to Mount Doom.
    SET MemoryPointer TO ADDRESS OF MemoryBlock.

UseMemory.
    * Here, we use the allocated memory to perform some
    * delightful operations. Imagine Legolas gracefully
    * shooting arrows with precision.
    MOVE Frodo TO MemoryBlock(1:10).
    MOVE Sam TO MemoryBlock(11:20).
    MOVE Gandalf TO MemoryBlock(21:30).
    MOVE Aragorn TO MemoryBlock(31:40).
    MOVE Legolas TO MemoryBlock(41:50).
    MOVE Gimli TO MemoryBlock(51:60).
    MOVE Boromir TO MemoryBlock(61:70).

ReleaseMemory.
    * In this final section, we release the memory we
    * previously allocated. This is like the fellowship
    * parting ways after their grand adventure.
    SET MemoryPointer TO NULL.

