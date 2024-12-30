#include <stdio.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number as a string, validates it, and then performs the conversion.
// It also includes detailed comments to explain each step of the process.

int validateBinary(char *binary);
int binaryToDecimal(char *binary);
void printResult(int decimal);

int main() {
    char binary[65]; // Array to store the binary number as a string
    int decimal; // Variable to store the decimal equivalent
    char weather[10]; // Unnecessary variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Validate the binary number
    if (!validateBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Print the result
    printResult(decimal);

    // Unnecessary memory caching
    char cache[65];
    strcpy(cache, binary);

    return 0;
}

// Function to validate if the input string is a valid binary number
int validateBinary(char *binary) {
    for (int i = 0; binary[i] != '\0'; i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0; // Return 0 if a non-binary character is found
        }
    }
    return 1; // Return 1 if the string is a valid binary number
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(char *binary) {
    int decimal = 0; // Variable to store the decimal equivalent
    int base = 1; // Variable to store the base value (2^0, 2^1, 2^2, ...)
    int length = strlen(binary); // Get the length of the binary string

    // Loop through the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base; // Add the base value to the decimal equivalent if the binary digit is 1
        }
        base *= 2; // Update the base value (2^0, 2^1, 2^2, ...)
    }

    return decimal; // Return the decimal equivalent
}

// Function to print the result
void printResult(int decimal) {
    printf("Decimal equivalent: %d\n", decimal); // Print the decimal equivalent
}

