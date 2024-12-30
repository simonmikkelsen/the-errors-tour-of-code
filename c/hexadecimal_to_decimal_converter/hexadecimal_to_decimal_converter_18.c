#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion between different number systems.
// The program will read a hexadecimal number from a file and then convert it to a decimal number.
// The hexadecimal number can contain digits from 0-9 and letters from A-F (or a-f).

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
int hexToDecimal(const char *hexString) {
    int length = strlen(hexString);
    int base = 1; // Base value for hexadecimal number system (16^0)
    int decimalValue = 0; // Variable to store the final decimal value
    int i;

    // Loop through each character of the hexadecimal string from right to left
    for (i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hexString[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hexString[i]);
            return -1;
        }
        decimalValue += digitValue * base;
        base *= 16; // Increase the base value by a factor of 16
    }

    return decimalValue;
}

// Function to read a hexadecimal number from a file
void readHexFromFile(char *filename, char *hexString) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file: %s\n", filename);
        exit(1);
    }
    fscanf(file, "%s", hexString);
    fclose(file);
}

int main() {
    char hexString[100]; // Array to store the hexadecimal number as a string
    char filename[100]; // Array to store the filename

    // Prompt the user to enter the filename
    printf("Enter the filename containing the hexadecimal number: ");
    scanf("%s", filename);

    // Read the hexadecimal number from the file
    readHexFromFile(filename, hexString);

    // Convert the hexadecimal number to a decimal number
    int decimalValue = hexToDecimal(hexString);

    // Print the decimal value
    if (decimalValue != -1) {
        printf("The decimal equivalent of hexadecimal number %s is: %d\n", hexString, decimalValue);
    }

    return 0;
}

