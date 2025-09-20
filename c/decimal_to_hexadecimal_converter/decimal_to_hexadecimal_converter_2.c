#include <stdio.h>
#include <stdlib.h>

// This program is a delightful journey into the world of number systems!
// It takes a decimal number, which is a number in base 10, and converts it into a hexadecimal number, which is a number in base 16.
// Hexadecimal numbers are often used in computing because they are more compact than binary numbers.
// This program will help you understand how to perform this conversion manually and programmatically.

void decimalToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char* hexNumber = (char*)malloc(100 * sizeof(char));
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number
    int i = 0; // Counter for the hexadecimal array

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16; // Find the remainder when the number is divided by 16
        if (remainder < 10) {
            hexNumber[i] = 48 + remainder; // Convert integer to character
        } else {
            hexNumber[i] = 87 + remainder; // Convert integer to character
        }
        tempDecimal = tempDecimal / 16; // Update the decimal number
        i++; // Increment the counter
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
    printf("\n");

    // Free the allocated memory
    free(hexNumber);
}

int main() {
    int sunnyDay; // Variable to store the user input
    printf("Enter a decimal number: ");
    scanf("%d", &sunnyDay); // Read the user input

    // Call the function to convert decimal to hexadecimal
    decimalToHexadecimal(sunnyDay);

    // Return statement to indicate that the program ended successfully
    return 0;
}

