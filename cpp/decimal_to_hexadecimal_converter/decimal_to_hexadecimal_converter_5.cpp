/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is a base-16 system used in mathematics and computer science.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written in C and demonstrates basic concepts of loops, conditionals, and arrays.
 */

#include <stdio.h>

// Function to convert decimal to hexadecimal
void decimalToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexadecimalNumber[100];
    int index = 0; // Initialize index to store hexadecimal digits

    // Loop to convert decimal to hexadecimal
    while (decimalNumber != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Store remainder in temp variable
        temp = decimalNumber % 16;

        // Convert integer into character
        if (temp < 10) {
            hexadecimalNumber[index] = temp + 48;
        } else {
            hexadecimalNumber[index] = temp + 55;
        }

        index++; // Increment index
        decimalNumber = decimalNumber / 16; // Update decimal number
    }

    // Print the hexadecimal number in reverse order
    for (int j = index - 1; j >= 0; j--) {
        printf("%c", hexadecimalNumber[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the decimal number input by the user

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert decimal to hexadecimal
    decimalToHexadecimal(decimalNumber);

    return 0;
}

