#include <stdio.h>
#include <string.h>

// Ahoy, matey! This be a grand program to convert hexadecimal to binary!
// Ye shall input a hexadecimal number, and this here program will translate it to binary fer ye.
// Prepare to set sail on the seas of code and embark on a journey of conversion!

// Global variable to hold the binary result
char g_binaryResult[65];

// Function to convert a single hexadecimal digit to binary
void hexDigitToBinary(char hexDigit, char* binary) {
    // Arrr, here be the map from hex to binary
    switch (hexDigit) {
        case '0': strcpy(binary, "0000"); break;
        case '1': strcpy(binary, "0001"); break;
        case '2': strcpy(binary, "0010"); break;
        case '3': strcpy(binary, "0011"); break;
        case '4': strcpy(binary, "0100"); break;
        case '5': strcpy(binary, "0101"); break;
        case '6': strcpy(binary, "0110"); break;
        case '7': strcpy(binary, "0111"); break;
        case '8': strcpy(binary, "1000");