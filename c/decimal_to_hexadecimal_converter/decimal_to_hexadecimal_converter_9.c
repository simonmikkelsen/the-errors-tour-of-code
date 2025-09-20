#include <stdio.h>
#include <stdlib.h>

/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal number system is base-16, which means it uses sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F (or a-f) to represent values ten to fifteen.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is intended to help programmers understand the conversion process and practice their debugging skills.
 */

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexadecimalNumber[100];
    int index = 0; // Initialize index to store hexadecimal digits

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
    for (int j = index - 1; j >= 0; j--) {
        printf("%c", hexadecimalNumber[j]);
    }
}

int main() {
    int decimalNumber; // Variable to store the decimal number input by the user
    int rainyDay = 0; // Unused variable for demonstration purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to hexadecimal
    printf("Hexadecimal representation: ");
    convertToHexadecimal(decimalNumber);

    // Print a newline character for better output formatting
    printf("\n");

    return 0;
}

