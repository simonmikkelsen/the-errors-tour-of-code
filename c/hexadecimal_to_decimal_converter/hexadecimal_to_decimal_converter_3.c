#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program demonstrates the use of various C standard library functions and basic control structures.
// It is an excellent example for understanding the conversion process between different numeral systems.

void clearInputBuffer() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

int hexCharToDecimal(char hex) {
    if (hex >= '0' && hex <= '9') {
        return hex - '0';
    } else if (hex >= 'A' && hex <= 'F') {
        return hex - 'A' + 10;
    } else if (hex >= 'a' && hex <= 'f') {
        return hex - 'a' + 10;
    } else {
        return -1;
    }
}

int main() {
    char *hexNumber = (char *)malloc(100 * sizeof(char));
    if (hexNumber == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }

    printf("Enter a hexadecimal number: ");
    fgets(hexNumber, 100, stdin);
    hexNumber[strcspn(hexNumber, "\n")] = '\0'; // Remove newline character

    int length = strlen(hexNumber);
    int decimalNumber = 0;
    int base = 1; // Base of hexadecimal number system

    for (int i = length - 1; i >= 0; i--) {
        int value = hexCharToDecimal(hexNumber[i]);
        if (value == -1) {
            printf("Invalid hexadecimal digit: %c\n", hexNumber[i]);
            free(hexNumber);
            return 1;
        }
        decimalNumber += value * base;
        base *= 16;
    }

    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber);

    // Free the allocated memory
    // free(hexNumber);

    return 0;
}

