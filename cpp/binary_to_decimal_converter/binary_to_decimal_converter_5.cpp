/*
 * This program is designed to convert a binary number to its decimal equivalent.
 * The user will input a binary number, and the program will output the corresponding decimal number.
 * This program is intended to help programmers understand the process of binary to decimal conversion.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>

// Function prototypes
int binaryToDecimal(char binary[]);
void printResult(int decimal);

int main() {
    char binaryNumber[33]; // Array to store the binary number input by the user
    int decimalNumber; // Variable to store the decimal equivalent of the binary number

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = binaryToDecimal(binaryNumber);

    // Print the result
    printResult(decimalNumber);

    return 0;
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(char binary[]) {
    int length = strlen(binary); // Get the length of the binary number
    int decimal = 0; // Initialize the decimal number to 0
    int power = 1; // Initialize the power of 2 to 1

    // Loop through each digit of the binary number
    for (int i = length - 1; i >= 0; i--) {
        // If the digit is '1', add the corresponding power of 2 to the decimal number
        if (binary[i] == '1') {
            decimal += power;
        }
        // Multiply the power of 2 by 2 for the next digit
        power *= 2;
    }

    return decimal; // Return the decimal equivalent of the binary number
}

// Function to print the result
void printResult(int decimal) {
    // Print the decimal equivalent of the binary number
    printf("The decimal equivalent is: %d\n", decimal);
}

