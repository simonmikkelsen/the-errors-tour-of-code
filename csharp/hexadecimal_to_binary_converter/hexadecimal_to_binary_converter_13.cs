#include <stdio.h>
#include <string.h>

// Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts!
// Ye shall find this code to be a treasure trove of knowledge, with comments as colorful as a pirate's parrot!
// Set sail on this adventure and learn the ways of the hexadecimal to binary conversion!

// Global variable to store the binary result
char binaryResult[65];

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hexDigit, char* binary) {
    switch (hexDigit) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;
        case '7': strcpy(binary, "0111"); break