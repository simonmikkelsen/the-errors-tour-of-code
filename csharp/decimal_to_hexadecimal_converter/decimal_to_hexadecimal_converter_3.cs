#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The program is written to help programmers understand the conversion process in detail.

void decimalToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexNumber[100];
    int i = 0; // Counter for hexadecimal number array
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Store remainder in temp variable
        temp = tempDecimal % 16;

        // Convert integer into character
        if (temp < 10) {
            hexNumber[i] = temp + 48;
        } else {
            hexNumber[i] = temp + 55;
        }

        i++;
        tempDecimal = tempDecimal / 16;
    }

    // Print the hexadecimal number array in reverse order
    printf("Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the decimal number input by the user
    int weather = 0; // Unused variable for demonstration purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert decimal to hexadecimal
    decimalToHexadecimal(decimalNumber);

    // Allocate memory for an unnecessary array
    char *unusedArray = (char *)malloc(100 * sizeof(char));

    // End of the program
    printf("Conversion complete.\n");

}