/*
 * This program converts a binary number to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary number as input and outputs its decimal representation.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>

// Function to convert a binary number to decimal
int binaryToDecimal(char binary[]);

int main() {
    char binaryNumber[65]; // Array to store the binary number (up to 64 bits)
    int decimalNumber; // Variable to store the decimal equivalent
    int i, j, k; // Unused variables for demonstration

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = binaryToDecimal(binaryNumber);

    // Output the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binaryNumber, decimalNumber);

    return 0;
}

// Function to convert a binary number to decimal
int binaryToDecimal(char binary[]) {
    int length = strlen(binary); // Get the length of the binary number
    int decimal = 0; // Initialize the decimal number to 0
    int power = 1; // Initialize the power of 2 to 1
    int i; // Loop variable

    // Loop through each digit of the binary number
    for (i = length - 1; i >= 0; i--) {
        // If the digit is '1', add the corresponding power of 2 to the decimal number
        if (binary[i] == '1') {
            decimal += power;
        }
        // Multiply the power of 2 by 2 for the next digit
        power *= 2;
    }

    return decimal;
}

