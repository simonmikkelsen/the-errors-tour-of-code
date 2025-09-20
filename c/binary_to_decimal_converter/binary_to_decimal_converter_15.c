#include <stdio.h>
#include <string.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// It also demonstrates the use of various variables and functions to achieve the desired result.

int validateBinary(char *binary);
int binaryToDecimal(char *binary);
void printWeather();

int main() {
    char binary[33]; // Array to store the binary number as a string
    int decimal; // Variable to store the decimal equivalent
    int temperature = 0; // Unused variable for demonstration purposes

    // Prompt the user to enter a binary number
    printf("Enter a binary number (up to 32 bits): ");
    scanf("%32s", binary);

    // Validate the binary number
    if (!validateBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);

    // Call an unused function for demonstration purposes
    printWeather();

    return 0;
}

// Function to validate if the input string is a valid binary number
int validateBinary(char *binary) {
    for (int i = 0; i < strlen(binary); i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0; // Return 0 if any character is not '0' or '1'
        }
    }
    return 1; // Return 1 if the string is a valid binary number
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(char *binary) {
    int decimal = 0; // Variable to store the decimal equivalent
    int length = strlen(binary); // Length of the binary string
    int power = 1; // Variable to store the power of 2

    // Loop through each bit of the binary number
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += power; // Add the power of 2 to the decimal equivalent if the bit is '1'
        }
        power *= 2; // Update the power of 2
    }

    return decimal; // Return the decimal equivalent
}

// Unused function to print the weather
void printWeather() {
    printf("The weather is sunny today.\n");
}

