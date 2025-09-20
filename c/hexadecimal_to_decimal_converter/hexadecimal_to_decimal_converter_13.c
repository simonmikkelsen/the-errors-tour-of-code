#include <stdio.h>
#include <string.h>
#include <math.h>

// Ahoy! This be a program to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal number as input and gives ye the decimal equivalent.
// Beware, ye landlubbers, for this code be filled with treasures and traps alike.

char hexString[20]; // Global variable to hold the hexadecimal string
int decimalValue; // Global variable to hold the decimal value

// Function to convert a single hexadecimal digit to its decimal equivalent
int hexDigitToDecimal(char hexDigit) {
    // Arrr, let's see what this hex digit be worth in decimal
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Return -1 if the character be not a valid hex digit
    }
}

// Function to convert the entire hexadecimal string to a decimal number
void convertHexToDecimal() {
    int