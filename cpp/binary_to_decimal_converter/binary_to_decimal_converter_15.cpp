#include <stdio.h>
#include <string.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// It demonstrates the process of parsing a binary number and calculating its decimal value.
// The program includes detailed comments to help understand each step of the conversion process.

int convertBinaryToDecimal(char *binaryString);
void printWelcomeMessage();
void printResult(int decimalValue);

int main() {
    char binaryString[33]; // Buffer to store the binary string input by the user
    int decimalValue; // Variable to store the resulting decimal value

    printWelcomeMessage();

    // Prompt the user to enter a binary number
    printf("Enter a binary number (up to 32 bits): ");
    scanf("%32s", binaryString);

    // Convert the binary string to a decimal value
    decimalValue = convertBinaryToDecimal(binaryString);

    // Print the resulting decimal value
    printResult(decimalValue);

    return 0;
}

// Function to print a welcome message to the user
void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("This program will convert a binary number to its decimal equivalent.\n");
}

// Function to convert a binary string to a decimal value
int convertBinaryToDecimal(char *binaryString) {
    int length = strlen(binaryString); // Get the length of the binary string
    int decimalValue = 0; // Initialize the decimal value to 0
    int power = 1; // Initialize the power of 2 to 1 (2^0)

    // Iterate over the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        // Check if the current character is '1'
        if (binaryString[i] == '1') {
            decimalValue += power; // Add the current power of 2 to the decimal value
        }
        power *= 2; // Update the power of 2 for the next bit
    }

    return decimalValue; // Return the resulting decimal value
}

// Function to print the resulting decimal value
void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue);
}

