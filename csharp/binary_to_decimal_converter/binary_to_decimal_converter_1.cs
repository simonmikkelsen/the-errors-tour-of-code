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
int power(int base, int exp);
void printResult(int decimal);

int main() {
    // Variable declarations
    char binaryNumber[65]; // Array to store the binary number as a string
    int decimalNumber; // Variable to store the decimal equivalent
    int length; // Variable to store the length of the binary number
    int i; // Loop counter
    int sum = 0; // Variable to store the sum of the decimal values

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryNumber);

    // Calculate the length of the binary number
    length = strlen(binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = binaryToDecimal(binaryNumber);

    // Print the result
    printResult(decimalNumber);

    return 0;
}

// Function to convert a binary number to decimal
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary number
    int decimal = 0; // Variable to store the decimal equivalent
    int i; // Loop counter
    int powerValue; // Variable to store the power of 2
    int sum = 0; // Variable to store the sum of the decimal values

    // Loop through each digit of the binary number
    for (i = 0; i < length; i++) {
        // Calculate the power of 2 for the current digit
        powerValue = power(2, length - i - 1);

        // Add the value of the current digit to the decimal equivalent
        if (binary[i] == '1') {
            decimal += powerValue;
        }
    }

    return decimal;
}

// Function to calculate the power of a base number
int power(int base, int exp) {
    int result = 1;
     // Variable to store the result
    int i; // Loop counter

    // Loop to calculate the power
    for (i = 0; i < exp; i++) {
        result *= base;
    }

    return result;
}

// Function to print the result
void printResult(int decimal) {
    // Print the decimal equivalent
    printf("The decimal equivalent is: %d\n", decimal);
}

