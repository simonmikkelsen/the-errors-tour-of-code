/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary format, the very essence of digital computation.
 * Prepare yourself for a journey through the arcane arts of regular expressions and bit manipulation!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function to convert a single hexadecimal digit to its binary equivalent
void hexDigitToBinary(char hexDigit, char *binary) {
    switch (hexDigit) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;