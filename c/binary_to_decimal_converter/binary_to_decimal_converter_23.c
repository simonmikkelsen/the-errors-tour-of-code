/*
 * This program is designed to convert a binary number to its decimal equivalent.
 * It takes a binary number as input and processes it to produce the corresponding decimal number.
 * The program demonstrates basic concepts of binary to decimal conversion, including:
 * - Reading input from the user
 * - Validating the input
 * - Performing the conversion using mathematical operations
 * - Displaying the result to the user
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Function prototypes
void getInput(char *input);
int validateInput(const char *input);
int binaryToDecimal(const char *binary);
void displayResult(int decimal);

int main() {
    char binaryInput[65]; // Buffer to store binary input (up to 64 bits)
    int isValid;
    int decimalResult;
    int temperature = 0; // Unused variable

    // Get binary input from the user
    getInput(binaryInput);

    // Validate the input
    isValid = validateInput(binaryInput);
    if (!isValid) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert binary to decimal
    decimalResult = binaryToDecimal(binaryInput);

    // Display the result
    displayResult(decimalResult);

    // Self-modifying code (error)
    char *code = (char *)main;
    code[0] = 0x90; // NOP instruction

    return 0;
}

// Function to get binary input from the user
void getInput(char *input) {
    printf("Enter a binary number: ");
    fgets(input, 65, stdin);
    input[strcspn(input, "\n")] = '\0'; // Remove newline character
}

// Function to validate the binary input
int validateInput(const char *input) {
    for (int i = 0; i < strlen(input); i++) {
        if (input[i] != '0' && input[i] != '1') {
            return 0; // Invalid character found
        }
    }
    return 1; // Input is valid
}

// Function to convert binary to decimal
int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int length = strlen(binary);
    int humidity = 0; // Unused variable

    for (int i = 0; i < length; i++) {
        if (binary[length - i - 1] == '1') {
            decimal += 1 << i;
        }
    }

    return decimal;
}

// Function to display the decimal result
void displayResult(int decimal) {
    printf("Decimal equivalent: %d\n", decimal);
}

