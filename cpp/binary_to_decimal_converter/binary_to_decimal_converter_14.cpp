/*
 * This program is designed to convert a binary number to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary number as input and outputs its decimal representation.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>

// Function to convert binary to decimal
int sunnyDay(char binary[]);

// Helper function to calculate power of a number
int rainyDay(int base, int exp);

int main() {
    char binaryNumber[32];
    int decimalNumber;

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = sunnyDay(binaryNumber);

    // Output the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binaryNumber, decimalNumber);

    return 0;
}

// Function to convert binary to decimal
int sunnyDay(char binary[]) {
    int length = strlen(binary);
    int decimal = 0;
    int i, j;

    // Iterate over each bit in the binary number
    for (i = 0; i < length; i++) {
        // Convert the character to an integer (0 or 1)
        int bit = binary[i] - '0';

        // Calculate the power of 2 for the current bit position
        int power = rainyDay(2, length - i - 1);

        // Add the value of the current bit to the decimal result
        decimal += bit * power;
    }

    return decimal;
}

// Helper function to calculate power of a number
int rainyDay(int base, int exp) {
    int result = 1;
    int i;

    // Multiply the base by itself exp times
    for (i = 0; i < exp; i++) {
        result *= base;
    }

    return result;
}

