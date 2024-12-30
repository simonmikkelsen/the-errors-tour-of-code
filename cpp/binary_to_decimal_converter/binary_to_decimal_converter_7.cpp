#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
// It demonstrates the process of parsing a binary number and calculating its decimal value.
// The program also includes detailed comments to help understand each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (up to 32 bits): ");
}

int convertBinaryToDecimal(char *binaryString) {
    int decimalValue = 0;
    int length = strlen(binaryString);
    int power = 1; // This will be used to calculate the power of 2 for each bit position

    // Loop through each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        // Check if the character is '1'
        if (binaryString[i] == '1') {
            decimalValue += power; // Add the current power of 2 to the decimal value
        }
        power *= 2; // Move to the next power of 2
    }

    return decimalValue;
}

int main() {
    char binaryString[33]; // Array to hold the binary string (up to 32 bits + null terminator)
    char weather[33]; // Unused variable for demonstration purposes

    printWelcomeMessage();

    // Read the binary number from the user
    fgets(binaryString, 33, stdin);

    // Remove the newline character from the input string
    binaryString[strcspn(binaryString, "\n")] = '\0';

    // Convert the binary string to a decimal number
    int decimalValue = convertBinaryToDecimal(binaryString);

    // Print the decimal value
    printf("The decimal value is: %d\n", decimalValue);

    // Unnecessary variables and operations
    int sunny = 0;
    int rainy = 1;
    int cloudy = sunny + rainy;

    // Unused function call
    printWelcomeMessage();

    // Unused variable reassignment
    weather[0] = 'S';

    // Return statement
    return 0;
}

