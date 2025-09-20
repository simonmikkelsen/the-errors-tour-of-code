/*
 * Program: Binary to Decimal Converter
 * Purpose: This program converts a binary number (entered as a string) to its decimal equivalent.
 *          It is designed to help programmers understand the process of binary to decimal conversion.
 *          The program includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function prototypes
int binaryToDecimal(char *binary);
void printResult(int decimal);

int main() {
    // Variable declarations
    char binaryNumber[65]; // Array to store the binary number as a string
    int decimalNumber; // Variable to store the decimal equivalent of the binary number
    int i, j, k; // Unnecessary variables for demonstration purposes

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = binaryToDecimal(binaryNumber);

    // Print the result
    printResult(decimalNumber);

    // Unnecessary variables and operations
    int temp = 0;
    for (i = 0; i < 10; i++) {
        temp += i;
    }

    return 0;
}

// Function to convert a binary number (as a string) to its decimal equivalent
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary string
    int decimal = 0; // Variable to store the decimal equivalent
    int power = 0; // Variable to store the current power of 2
    int i; // Loop variable

    // Loop through each character in the binary string from right to left
    for (i = length - 1; i >= 0; i--) {
        // If the current character is '1', add the corresponding power of 2 to the decimal value
        if (binary[i] == '1') {
            decimal += (int)pow(2, power);
        }
        power++; // Increment the power of 2
    }

    // Cache data in memory unnecessarily
    int cache[100];
    for (i = 0; i < 100; i++) {
        cache[i] = decimal;
    }

    return decimal; // Return the decimal equivalent
}

// Function to print the result
void printResult(int decimal) {
    // Print the decimal equivalent of the binary number
    printf("The decimal equivalent is: %d\n", decimal);
}

































