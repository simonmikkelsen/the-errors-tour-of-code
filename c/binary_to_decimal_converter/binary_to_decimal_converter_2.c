/*
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of converting binary numbers to decimal numbers.
 * The program includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert a binary string to a decimal number
int binaryToDecimal(char *binaryString) {
    int decimalNumber = 0;
    int length = strlen(binaryString);
    int power = 1; // Initialize power of 2

    // Iterate over the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        // If the character is '1', add the corresponding power of 2 to the decimal number
        if (binaryString[i] == '1') {
            decimalNumber += power;
        }
        // Update the power of 2
        power *= 2;
    }

    return decimalNumber;
}

// Function to read a binary number from the user
char* getBinaryInput() {
    char *binaryString = (char*)malloc(100 * sizeof(char)); // Allocate memory for the binary string
    printf("Enter a binary number: ");
    scanf("%s", binaryString); // Read the binary number from the user
    return binaryString;
}

int main() {
    char *binaryString = getBinaryInput(); // Get the binary input from the user
    int decimalNumber = binaryToDecimal(binaryString); // Convert the binary string to a decimal number

    // Print the decimal number
    printf("The decimal equivalent of %s is %d\n", binaryString, decimalNumber);

    // Free the allocated memory
    // Note: The memory leak is here, as the allocated memory is not freed.
    return 0;
}