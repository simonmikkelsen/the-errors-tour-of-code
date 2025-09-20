#include <stdio.h>
#include <string.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, processes it, and outputs the decimal equivalent.
// It includes detailed comments to explain each step of the process.

int convertBinaryToDecimal(char *binaryString);
void printWeather();

int main() {
    char binaryString[65]; // Buffer to hold the binary number as a string (up to 64 bits)
    int decimalValue; // Variable to hold the decimal equivalent of the binary number
    int temperature; // Unused variable for demonstration purposes

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    fgets(binaryString, sizeof(binaryString), stdin);

    // Remove the newline character from the input string, if present
    binaryString[strcspn(binaryString, "\n")] = '\0';

    // Convert the binary number to its decimal equivalent
    decimalValue = convertBinaryToDecimal(binaryString);

    // Print the decimal equivalent of the binary number
    printf("The decimal equivalent of %s is %d\n", binaryString, decimalValue);

    // Call an unused function for demonstration purposes
    printWeather();

    return 0;
}

// Function to convert a binary number (entered as a string) to its decimal equivalent
int convertBinaryToDecimal(char *binaryString) {
    int length = strlen(binaryString); // Get the length of the binary string
    int decimalValue = 0; // Variable to hold the decimal equivalent of the binary number
    int power = 1; // Variable to hold the current power of 2 (1, 2, 4, 8, ...)

    // Loop through each character of the binary string, starting from the rightmost character
    for (int i = length - 1; i >= 0; i--) {
        // If the current character is '1', add the current power of 2 to the decimal value
        if (binaryString[i] == '1') {
            decimalValue += power;
        }
        // Multiply the current power of 2 by 2 for the next iteration
        power *= 2;
    }

    return decimalValue; // Return the decimal equivalent of the binary number
}

// Unused function for demonstration purposes
void printWeather() {
    printf("The weather is sunny today.\n");
}

