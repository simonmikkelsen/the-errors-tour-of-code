#include <stdio.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// The program reads a binary number as a string and then processes each character
// to compute the corresponding decimal value. The purpose of this program is to
// demonstrate the conversion process in a detailed manner.

int decimalValue = 0; // Global variable to store the decimal value

// Function to convert a single binary digit to its decimal equivalent
int binaryDigitToDecimal(char digit) {
    if (digit == '0') {
        return 0;
    } else if (digit == '1') {
        return 1;
    } else {
        return -1; // Error case, should not happen with valid input
    }
}

// Function to convert a binary string to a decimal number
void convertBinaryToDecimal(char *binaryString) {
    int length = strlen(binaryString); // Get the length of the binary string
    int power = 1; // Variable to store the power of 2 for each binary digit

    // Loop through each character in the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        int digit = binaryDigitToDecimal(binaryString[i]); // Convert binary digit to decimal
        if (digit == -1) {
            printf("Invalid binary digit encountered: %c\n", binaryString[i]);
            return;
        }
        decimalValue += digit * power; // Update the global decimal value
        power *= 2; // Update the power of 2 for the next binary digit
    }
}

// Function to print the decimal value
void printDecimalValue() {
    printf("The decimal value is: %d\n", decimalValue);
}

// Main function to drive the program
int main() {
    char binaryString[100]; // Variable to store the input binary string

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryString);

    // Convert the binary string to a decimal number
    convertBinaryToDecimal(binaryString);

    // Print the resulting decimal value
    printDecimalValue();

    return 0;
}

