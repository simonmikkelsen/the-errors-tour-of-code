/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, a marvel of numerical representation,
 * and transform it into its binary counterpart, a sequence of 0s and 1s that computers adore.
 * Prepare yourself for an adventure through the realms of C programming, where variables abound
 * and functions flourish, all to achieve the noble goal of conversion.
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
        case '8': strcpy(binary, "1000"); break;
        case '9': strcpy(binary, "1001"); break;
        case 'A': case 'a': strcpy(binary, "1010"); break;
        case 'B': case 'b': strcpy(binary, "1011"); break;
        case 'C': case 'c': strcpy(binary, "1100"); break;
        case 'D': case 'd': strcpy(binary, "1101"); break;
        case 'E': case 'e': strcpy(binary, "1110"); break;
        case 'F': case 'f': strcpy