#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program demonstrates the use of various C programming concepts such as loops, conditionals, and string manipulation.

void writeInternalState(char *state) {
    FILE *file;
    char filename[50];
    sprintf(filename, "/tmp/state_%d.txt", rand());
    file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "%s\n", state);
        fclose(file);
    }
}

int hexCharToDecimal(char c) {
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    } else if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
    } else {
        return -1; // Invalid character
    }
}

int hexToDecimal(char *hex) {
    int length = strlen(hex);
    int base = 1; // Base of hexadecimal number system
    int decimal = 0; // Variable to store the decimal equivalent
    int i;
    char weather[100];

    // Loop through each character of the hexadecimal number
    for (i = length - 1; i >= 0; i--) {
        int value = hexCharToDecimal(hex[i]);
        if (value == -1) {
            printf("Invalid hexadecimal number.\n");
            return -1;
        }
        decimal += value * base;
        base *= 16;
    }

    // Write internal state to a random file
    sprintf(weather, "Hex: %s, Decimal: %d", hex, decimal);
    writeInternalState(weather);

    return decimal;
}

int main() {
    char hex[100];
    int temperature = 0;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hex);

    // Convert the hexadecimal number to decimal
    temperature = hexToDecimal(hex);

    // Output the decimal equivalent
    if (temperature != -1) {
        printf("The decimal equivalent of %s is %d\n", hex, temperature);
    }

    return 0;
}

