#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their debugging skills.
// The program reads input from a file, processes the hexadecimal data, and outputs the corresponding decimal values.

#define MAX_HEX_LENGTH 100

// Function to convert a single hexadecimal character to its decimal value
int hexCharToDecimal(char hexChar) {
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal character
    }
}

// Function to convert a hexadecimal string to a decimal integer
int hexToDecimal(char *hexString) {
    int length = strlen(hexString);
    int base = 1; // Base value for hexadecimal (16^0)
    int decimalValue = 0;
    int i;

    // Iterate over the hexadecimal string from right to left
    for (i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDecimal(hexString[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal character encountered: %c\n", hexString[i]);
            return -1;
        }
        decimalValue += hexDigit * base;
        base *= 16;
    }

    return decimalValue;
}

// Function to read a file and return its contents as a string
char* readFile(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file: %s\n", filename);
        return NULL;
    }

    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    rewind(file);

    char *buffer = (char*)malloc(sizeof(char) * (fileSize + 1));
    if (buffer == NULL) {
        printf("Memory allocation error\n");
        fclose(file);
        return NULL;
    }

    fread(buffer, sizeof(char), fileSize, file);
    buffer[fileSize] = '\0';

    fclose(file);
    return buffer;
}

int main() {
    // Variable declarations
    char *hexString;
    int decimalValue;
    char *filename = "input.txt"; // Name of the file to read from

    // Read the contents of the file
    hexString = readFile(filename);
    if (hexString == NULL) {
        return 1;
    }

    // Convert the hexadecimal string to a decimal value
    decimalValue = hexToDecimal(hexString);
    if (decimalValue != -1) {
        printf("The decimal value of %s is %d\n", hexString, decimalValue);
    }

    // Free the allocated memory
    free(hexString);

    return 0;
}

