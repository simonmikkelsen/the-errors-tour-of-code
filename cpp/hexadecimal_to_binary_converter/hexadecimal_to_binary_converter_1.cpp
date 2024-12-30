/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the enchanting realms of number systems.
 * Here, you shall witness the transformation of a hexadecimal number into its binary counterpart.
 * Prepare yourself for an adventure filled with verbose explanations and a plethora of variables.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hexDigit, char *binary) {
    switch (hexDigit) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;
        case '7': strcpy(binary