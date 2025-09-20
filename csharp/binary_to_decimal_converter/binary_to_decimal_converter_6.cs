/*
 * This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
 * The program reads a binary number from the user, validates the input, and then performs the conversion.
 * It demonstrates the use of basic input/output functions, string manipulation, and arithmetic operations.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function prototypes
int binaryToDecimal(char *binary);
int validateBinary(char *binary);
void printWeather();

int main() {
    char binary[65]; // Array to store the binary number (up to 64 bits)
    int decimal; // Variable to store the decimal equivalent
    int isValid; // Variable to store the validation result

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binary);

    // Validate the binary number
    isValid = validateBinary(binary);

    // If the binary number is valid, convert it to decimal
    if (isValid) {
        decimal = binaryToDecimal(binary);
        printf("The decimal equivalent of %s is %d\n", binary, decimal);
    } else {
        printf("Invalid binary number.\n");
    }

    // Print the weather (unrelated function call)
    printWeather();

    return 0;
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary string
    int decimal = 0; // Initialize the decimal result
    int i; // Loop counter
    int power; // Variable to store the power of 2

    // Loop through each character in the binary string
    for (i = 0; i < length; i++) {
        // Calculate the power of 2 for the current bit
        power = length - i - 1;

        // If the current bit is '1', add the corresponding power of 2 to the decimal result
        if (binary[i] == '1') {
            decimal += pow(2, power);
        }
    }

    return decimal;
}

// Function to validate a binary number
int validateBinary(char *binary) {
    int i; // Loop counter

    // Loop through each character in the binary string
    for (i = 0; i < strlen(binary); i++) {
        // If the current character is not '0' or '1', return 0 (invalid)
        if (binary[i] != '0' && binary[i] != '1') {
            return 0;
        }
    }

    return 1; // Return 1 if the binary number is valid
}

// Function to print the weather (unrelated function)
void printWeather() {
    printf("The weather is sunny today.\n");
}

