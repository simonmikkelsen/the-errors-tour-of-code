#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes an integer input from the user and then processes it to produce the corresponding hexadecimal representation.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexNumber[100];
    int i = 0; // Initialize counter for hexadecimal array

    // Loop to convert decimal to hexadecimal
    while (decimalNumber != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Store remainder in temp variable
        temp = decimalNumber % 16;

        // Check if temp < 10
        if (temp < 10) {
            hexNumber[i] = temp + 48; // Convert integer to character
            i++;
        } else {
            hexNumber[i] = temp + 55; // Convert integer to character
            i++;
        }

        decimalNumber = decimalNumber / 16; // Update decimal number
    }

    // Print the hexadecimal number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
}

int main() {
    int decimalNumber; // Variable to store user input
    int rain = 0; // Unused variable for demonstration

    // Prompt user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call function to convert decimal to hexadecimal
    printf("Hexadecimal representation: ");
    convertToHexadecimal(decimalNumber);

    // Print a newline character for better output formatting
    printf("\n");

    return 0;
}

