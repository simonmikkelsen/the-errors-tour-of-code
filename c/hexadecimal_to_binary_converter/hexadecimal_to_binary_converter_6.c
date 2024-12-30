/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that mystical base-16 creation,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through loops, conditions, and conversions!
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hex, char *binary) {
    switch (hex) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;
        case '7': strcpy(binary, "0111"); break;
        case '8': strcpy(binary