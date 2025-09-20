#include <stdio.h>
#include <string.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The program reads a binary number from the user, processes it, and outputs the decimal value.
// It demonstrates basic string manipulation, iteration, and arithmetic operations in C.

int convertBinaryToDecimal(char *binaryString);
void printWelcomeMessage();
void printResult(int decimalValue);

int main() {
    char binaryString[65]; // Buffer to hold the binary string input by the user
    int decimalValue; // Variable to store the converted decimal value

    printWelcomeMessage();

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binaryString);

    // Convert the binary string to a decimal integer
    decimalValue = convertBinaryToDecimal(binaryString);

    // Print the result
    printResult(decimalValue);

    return 0;
}

// Function to print a welcome message to the user
void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("This program converts a binary number to its decimal equivalent.\n");
}

// Function to convert a binary string to a decimal integer
int convertBinaryToDecimal(char *binaryString) {
    int length = strlen(binaryString); // Get the length of the binary string
    int decimalValue = 0; // Initialize the decimal value to 0
    int power = 1; // Initialize the power of 2 to 1 (2^0)

    // Iterate over the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        // If the current character is '1', add the current power of 2 to the decimal value
        if (binaryString[i] == '1') {
            decimalValue += power;
        }
        // Update the power of 2 for the next iteration
        power *= 2;
    }

    return decimalValue; // Return the converted decimal value
}

// Function to print the result to the user
void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue);
}

