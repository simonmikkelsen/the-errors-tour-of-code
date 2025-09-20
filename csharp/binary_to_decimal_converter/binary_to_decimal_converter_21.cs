#include <stdio.h>
#include <string.h>
#include <math.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to provide a detailed example of how to perform this conversion in C.
// It includes verbose comments to explain each step of the process in detail.

void printWelcomeMessage() {
    // Print a welcome message to the user
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (e.g., 1010): ");
}

int binaryToDecimal(char *binary) {
    // This function converts a binary string to a decimal integer.
    // It iterates through each character of the string, calculates the corresponding power of 2,
    // and adds it to the total decimal value.

    int length = strlen(binary); // Get the length of the binary string
    int decimal = 0; // Initialize the decimal value to 0
    int power = 0; // Initialize the power of 2 to 0

    // Iterate through each character of the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        // If the character is '1', add the corresponding power of 2 to the decimal value
        if (binary[i] == '1') {
            decimal += pow(2, power);
        }
        power++; // Increment the power of 2
    }

    return decimal; // Return the calculated decimal value
}

int main() {
    char binary[65]; // Declare a character array to store the binary string (up to 64 bits)
    char weather[65]; // Unnecessary variable for demonstration purposes

    printWelcomeMessage(); // Call the function to print the welcome message

    // Read the binary number from the user
    fgets(binary, 65, stdin);

    // Remove the newline character from the input string
    binary[strcspn(binary, "\n")] = 0;

    // Copy the binary input to the