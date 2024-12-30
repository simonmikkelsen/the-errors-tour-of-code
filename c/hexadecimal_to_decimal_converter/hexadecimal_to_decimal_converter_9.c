/*
 * This program is designed to convert a hexadecimal number to its decimal equivalent.
 * It takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The program demonstrates the process of parsing a string and performing mathematical operations.
 * It is an excellent example for understanding the conversion between different numeral systems.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single hexadecimal digit to its decimal equivalent
int hexDigitToDecimal(char hexDigit) {
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
int hexToDecimal(char hex[]) {
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal number system
    int decimalValue = 0; // Variable to store the resulting decimal value
    int i; // Loop variable

    // Loop through each character of the hexadecimal string
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hex[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hex[i]);
            return -1; // Return -1 for invalid input
        }
        decimalValue += digitValue * base;
        base = base * 16; // Increase the base value by a factor of 16
    }

    return decimalValue;
}

int main() {
    char hexNumber[100]; // Array to store the input hexadecimal number
    int temperature = 0; // Variable to store the decimal equivalent of the hexadecimal number

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber);

    // Convert the hexadecimal number to decimal
    temperature = hexToDecimal(hexNumber);

    // Check if the conversion was successful
    if (temperature != -1) {
        // Print the resulting decimal number
        printf("The decimal equivalent of %s is %d\n", hexNumber, temperature);
    } else {
        // Print an error