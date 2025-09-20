#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Behold! This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
// It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious with newfound knowledge.
// Prepare yourself for an adventure through the realms of hexadecimal and binary, where each digit tells a tale of its own.

void printBinary(char hexDigit) {
    switch (hexDigit) {
        case '0': printf("0000"); break;
        case '1': printf("0001"); break;
        case '2': printf("0010"); break;
        case '3': printf("0011"); break;
        case '4': printf("0100"); break;
        case '5': printf("0101"); break;
        case '6': printf("0110"); break;
        case '7': printf("0111"); break;
        case '8': printf("1000"); break;
        case '9': printf("1001"); break;
        case 'A': case 'a': printf("1010"); break;
        case 'B': case