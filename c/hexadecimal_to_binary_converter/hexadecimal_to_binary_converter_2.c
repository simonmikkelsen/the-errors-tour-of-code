#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to transform hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the enchanting world of number systems and conversions.
// Prepare to be dazzled by the elegance and grace of this code!

// Function to convert a single hexadecimal digit to a binary string
char* hexDigitToBinary(char hex) {
    switch (hex) {
        case '0': return "0000";
        case '1': return "0001";
        case '2': return "0010";
        case '3': return "0011";
        case '4': return "0100";
        case '5': return "0101";
        case '6': return "0110";
        case '7': return "0111";
        case '8': return "1000";
        case '9': return "1001";
        case 'A': case 'a': return "1010";
        case 'B': case 'b': return "1011";
        case 'C': case 'c': return "