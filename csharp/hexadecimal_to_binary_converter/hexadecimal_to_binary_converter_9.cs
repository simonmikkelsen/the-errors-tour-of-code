/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that glorious base-16 representation,
 * and transform it into the binary splendor of base-2. Prepare yourself for a journey through
 * the realms of bits and nibbles, where each character of the hexadecimal number will be
 * meticulously converted into its binary counterpart.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hexDigit, char* binary) {
    switch (hexDigit) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110