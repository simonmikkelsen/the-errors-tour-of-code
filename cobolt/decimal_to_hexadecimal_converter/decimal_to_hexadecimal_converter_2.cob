IDENTIFICATION DIVISION.
PROGRAM-ID. DecimalToHexadecimalConverter.
AUTHOR. Simon Mikkelsen.
* This program is a delightful journey through the world of number systems.
* It converts decimal numbers into their hexadecimal counterparts.
* The program is designed to be a learning tool for budding programmers.
* Enjoy the whimsical comments and the creative variable names!

DATA DIVISION.
WORKING-STORAGE SECTION.
01  decimalNumber        PIC 9(10) VALUE 0.
01  hexString            PIC X(8) VALUE SPACES.
01  remainder            PIC 9 VALUE 0.
01  tempNumber           PIC 9(10) VALUE 0.
01  index                PIC 9 VALUE 0.
01  hexDigits            PIC X(16) VALUE '0123456789ABCDEF'.
01  weather              PIC X(10) VALUE 'Sunny'.
01  unusedVar1           PIC 9 VALUE 0.
01  unusedVar2           PIC 9 VALUE 0.
01