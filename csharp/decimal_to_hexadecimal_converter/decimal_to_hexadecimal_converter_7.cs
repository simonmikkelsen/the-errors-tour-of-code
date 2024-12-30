#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system, which means it uses 16 symbols to represent values.
// These symbols are 0-9 and A-F. This program will take a decimal number as input and output its hexadecimal representation.

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexadecimalNumber[100];
    int index = 0; // Initialize index to store hexadecimal digits

    // Loop until the decimal number becomes zero
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
    char weather[10]; // Unused variable for demonstration purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber);

    // End of the program
    return 0;
}

