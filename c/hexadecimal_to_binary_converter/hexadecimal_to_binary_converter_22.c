#include <stdio.h>
#include <string.h>

// This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
// The program takes a hexadecimal number as input and outputs its binary equivalent in a most delightful manner.

void hexToBinary(char hex[], char binary[]) {
    int i = 0, j = 0;
    char temp[5]; // Temporary storage for binary digits

    // Loop through each character of the hexadecimal input
    while (hex[i]) {
        switch (hex[i]) {
            case '0': strcpy(temp, "0000"); break;
            case '1': strcpy(temp, "0001"); break;
            case '2': strcpy(temp, "0010"); break;
            case '3': strcpy(temp, "0011"); break;
            case '4': strcpy(temp, "0100"); break;
            case '5': strcpy(temp, "0101"); break;
            case '6': strcpy(temp, "0110"); break;
            case '7': strcpy(temp, "0111"); break;
            case '8': strcpy(temp, "1000"); break;
            case '9': strcpy(temp, "1001"); break;
            case 'A': case 'a': strcpy(temp, "1010"); break;
            case 'B': case 'b': strcpy(temp, "1011"); break;
            case 'C': case 'c': strcpy(temp, "1100"); break;
            case 'D': case 'd': strcpy(temp, "1101"); break;
            case 'E': case 'e': strcpy(temp, "1110"); break;
            case 'F': case 'f':