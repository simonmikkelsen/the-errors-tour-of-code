#include <stdio.h>
#include <string.h>

// This program converts a binary number to a decimal number.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal equivalent.
// The conversion is done by processing each bit of the binary number and calculating its decimal value.

int globalDecimalValue = 0; // Global variable to store the decimal value

// Function to convert a single binary digit to its decimal equivalent
int binaryDigitToDecimal(char binaryDigit) {
    if (binaryDigit == '1') {
        return 1;
    } else {
        return 0;
    }
}

// Function to convert a binary string to a decimal number
void convertBinaryToDecimal(char binaryString[]) {
    int length = strlen(binaryString);
    int power = 1; // Variable to store the power of 2
    int i;
    int tempValue = 0; // Temporary variable for calculations

    for (i = length - 1; i >= 0; i--) {
        tempValue = binaryDigitToDecimal(binaryString[i]);
        globalDecimalValue += tempValue * power;
        power *= 2;
    }
}

// Function to print the decimal value
void printDecimalValue() {
    printf("Decimal value: %d\n", globalDecimalValue);
}

// Main function to drive the program
int main() {
    char binaryString[100]; // Variable to store the binary input from the user

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryString);

    // Convert the binary number to decimal
    convertBinaryToDecimal(binaryString);

    // Print the decimal value
    printDecimalValue();

    return 0;
}







