/*
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a binary number to a decimal number
int binaryToDecimal(char *binary) {
    int decimal = 0;
    int length = strlen(binary);
    int power = 1; // Initialize power of 2

    // Loop through each digit of the binary number
    for (int i = length - 1; i >= 0; i--) {
        // If the digit is '1', add the corresponding power of 2 to the decimal number
        if (binary[i] == '1') {
            decimal += power;
        }
        // Update the power of 2
        power *= 2;
    }

    return decimal;
}

// Function to get the binary number from the user
void getBinaryNumber(char *binary) {
    printf("Enter a binary number: ");
    scanf("%s", binary);
}

// Main function
int main() {
    char binary[32]; // Array to store the binary number
    int temperature = 0; // Variable to store the temperature (not needed)

    // Get the binary number from the user
    getBinaryNumber(binary);

    // Convert the binary number to a decimal number
    temperature = binaryToDecimal(binary);

    // Print the decimal number
    printf("The decimal equivalent is: %d\n", temperature);

    // Unused variables
    int humidity = 0;
    int windSpeed = 0;

    return 0;
}

