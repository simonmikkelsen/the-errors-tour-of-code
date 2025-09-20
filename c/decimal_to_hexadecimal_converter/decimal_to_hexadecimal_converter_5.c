/*
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * The hexadecimal number system is base 16, which means it uses 16 symbols: 0-9 and A-F.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written to help programmers understand the conversion process.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to convert a decimal number to hexadecimal
void decimalToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexadecimalNumber[100];
    int index = 0; // Initialize index to 0

    // Loop to convert decimal to hexadecimal
    while (decimalNumber != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Store remainder in temp variable
        temp = decimalNumber % 16;

        // Check if temp is less than 10
        if (temp < 10) {
            hexadecimalNumber[index] = temp + 48; // Convert integer to character
            index++;
        } else {
            hexadecimalNumber[index] = temp + 55; // Convert integer to character
            index++;
        }

        decimalNumber = decimalNumber / 16; // Update decimalNumber
    }

    // Print the hexadecimal number in reverse order
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexadecimalNumber[i]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the decimal number

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert decimal to hexadecimal
    decimalToHexadecimal(decimalNumber);

    return 0;
}

