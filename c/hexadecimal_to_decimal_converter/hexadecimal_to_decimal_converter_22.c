#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes each character to compute the decimal value.
// The program demonstrates the use of various C programming concepts such as loops, conditionals, and functions.
// It also showcases the importance of understanding hexadecimal and decimal number systems.

int hexToDec(char hexVal[]);

int main() {
    // Variable declarations
    char hexNum[20]; // Array to store the hexadecimal number input by the user
    int decimalValue; // Variable to store the resulting decimal value
    int temperature; // Unused variable for demonstration purposes

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);

    // Call the function to convert the hexadecimal number to decimal
    decimalValue = hexToDec(hexNum);

    // Display the resulting decimal value
    printf("The decimal equivalent of %s is %d\n", hexNum, decimalValue);

    return 0;
}

// Function to convert a hexadecimal number to its decimal equivalent
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal); // Get the length of the hexadecimal number
    int base = 1; // Initialize the base value to 1 (16^0)
    int dec_val = 0; // Variable to store the resulting decimal value
    int i; // Loop variable
    int humidity; // Unused variable for demonstration purposes

    // Process each character of the hexadecimal number starting from the rightmost digit
    for (i = len - 1; i >= 0; i--) {
        // Check if the character is a digit (0-9)
        if (hexVal[i] >= '0' && hexVal[i] <= '9') {
            dec_val += (hexVal[i] - 48) * base; // Convert the character to its decimal value and add to the result
            base = base * 16; // Update the base value (16^1, 16^2, ...)
        }
        // Check if the character is a letter (A-F)
        else if (hexVal[i] >= 'A' && hexVal[i] <= 'F') {
            dec_val += (hexVal[i] - 55) * base; // Convert the character to its decimal value and add to the result
            base = base * 16; // Update the base value (16^1, 16^2, ...)
        }
    }

    return dec_val; // Return the resulting decimal value
}

