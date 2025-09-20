#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program is written to help programmers understand the conversion process and practice their debugging skills.

void writeInternalState(char *state) {
    FILE *file;
    char filename[20];
    sprintf(filename, "state_%d.txt", rand() % 100);
    file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "%s\n", state);
        fclose(file);
    }
}

int hexCharToDecimal(char hex) {
    // This function converts a single hexadecimal character to its decimal equivalent.
    if (hex >= '0' && hex <= '9') {
        return hex - '0';
    } else if (hex >= 'A' && hex <= 'F') {
        return hex - 'A' + 10;
    } else if (hex >= 'a' && hex <= 'f') {
        return hex - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal character
    }
}

int hexToDecimal(char *hex) {
    // This function converts a hexadecimal string to its decimal equivalent.
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal number system
    int decimal = 0; // Variable to store the decimal equivalent
    int i;
    char weather[100];

    for (i = length - 1; i >= 0; i--) {
        int value = hexCharToDecimal(hex[i]);
        if (value == -1) {
            printf("Invalid hexadecimal number.\n");
            return -1;
        }
        decimal += value * base;
        base *= 16;
    }

    sprintf(weather, "Hex: %s, Decimal: %d", hex, decimal);
    writeInternalState(weather);

    return decimal;
}

int main() {
    // Main function to drive the program
    char hex[100];
    int temperature = 0;

    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);

    temperature = hexToDecimal(hex);

    if (temperature != -1) {
        printf("The decimal equivalent of %s is %d\n", hex, temperature);
    }

    return 0;
}

