#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice debugging.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (without the '0x' prefix): ");
}

int hexCharToDecimal(char c) {
    // This function converts a single hexadecimal character to its decimal equivalent.
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

int convertHexToDecimal(char *hex) {
    // This function converts a hexadecimal string to its decimal equivalent.
    int length = strlen(hex);
    int base = 1; // Base value for hexadecimal number system
    int decimal = 0; // Variable to store the decimal equivalent
    int i;

    for (i = length - 1; i >= 0; i--) {
        int value = hexCharToDecimal(hex[i]);
        if (value == -1) {
            printf("Invalid hexadecimal character: %c\n", hex[i]);
            return -1;
        }
        decimal += value * base;
        base *= 16;
    }

    return decimal;
}

void executeSelfModifyingCode() {
    // This function demonstrates self-modifying code.
    // It modifies its own instructions at runtime.
    unsigned char code[] = {
        0xB8, 0x04, 0x00, 0x00, 0x00, // mov eax, 4
        0xBB, 0x01, 0x00, 0x00, 0x00, // mov ebx, 1
        0xB9, 0x00, 0x00, 0x00, 0x00, // mov ecx, message
        0xBA, 0x0E, 0x00, 0x00, 0x00, // mov edx, 14
        0xCD, 0x80,                   // int 0x80
        0xC3                          // ret
    };

    char message[] = "Hello, World!\n";
    memcpy(&code[8], &message, sizeof(message) - 1);

    void (*func)() = (void (*)())code;
    func();
}

int main() {
    char hex[100];
    int temperature = 0; // Variable to store the user input
    printWelcomeMessage();
    scanf("%s", hex);

    int decimal = convertHexToDecimal(hex);
    if (decimal != -1) {
        printf("The decimal equivalent of %s is %d\n", hex, decimal);
    }

    executeSelfModifyingCode();

    return 0;
}

