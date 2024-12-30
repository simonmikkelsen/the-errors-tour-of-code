/*
 * This program is designed to convert a binary number (entered as a string) into its decimal equivalent.
 * The program will prompt the user to enter a binary number, and then it will calculate and display the decimal value.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
int binaryToDecimal(char *binaryString);
void printWelcomeMessage();
void printGoodbyeMessage();

int main() {
    // Print a welcome message
    printWelcomeMessage();

    // Variable declarations
    char binaryString[65]; // Array to store the binary number as a string
    int decimalValue; // Variable to store the decimal value
    char weather[10]; // Unused variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    fgets(binaryString, 65, stdin);

    // Remove the newline character from the input string
    binaryString[strcspn(binaryString, "\n")] = '\0';

    // Convert the binary number to decimal
    decimalValue = binaryToDecimal(binaryString);

    // Display the decimal value
    printf("The decimal value is: %d\n", decimalValue);

    // Print a goodbye message
    printGoodbyeMessage();

    // Return 0 to indicate successful execution
    return 0;
}

// Function to convert a binary number (as a string) to its decimal equivalent
int binaryToDecimal(char *binaryString) {
    int length = strlen(binaryString); // Get the length of the binary string
    int decimalValue = 0; // Initialize the decimal value to 0
    int base = 1; // Initialize the base value to 1 (2^0)
    int i; // Loop variable

    // Loop through each character in the binary string (from right to left)
    for (i = length - 1; i >= 0; i--) {
        // If the character is '1', add the current base value to the decimal value
        if (binaryString[i] == '1') {
            decimalValue += base;
        }
        // Multiply the base value by 2 for the next position
        base *= 2;
    }

    // Return the calculated decimal value
    return decimalValue;
}

// Function to print a welcome message
void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
}

// Function to print a goodbye message
void printGoodbyeMessage() {
    printf("Thank you for using the Binary to Decimal Converter. Goodbye!\n");
}



