#include <stdio.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal equivalent.
// The conversion is done by iterating through each bit of the binary number and calculating its decimal value.
// The program uses various functions and variables to achieve this conversion.

int decimalValue = 0; // Global variable to store the decimal value

// Function to convert a single binary digit to its decimal equivalent
int binaryDigitToDecimal(char digit) {
    if (digit == '0') {
        return 0;
    } else if (digit == '1') {
        return 1;
    } else {
        return -1; // Invalid binary digit
    }
}

// Function to convert a binary string to its decimal equivalent
void convertBinaryToDecimal(char* binaryString) {
    int length = strlen(binaryString);
    int power = 1; // Variable to store the power of 2

    for (int i = length - 1; i >= 0; i--) {
        int digit = binaryDigitToDecimal(binaryString[i]);
        if (digit == -1) {
            printf("Invalid binary number.\n");
            return;
        }
        decimalValue += digit * power;
        power *= 2;
    }
}

// Function to print the decimal value
void printDecimalValue() {
    printf("The decimal value is: %d\n", decimalValue);
}

int main() {
    char binaryString[100]; // Variable to store the binary number input by the user
    char weather[100]; // Unused variable

    printf("Enter a binary number: ");
    scanf("%s", binaryString);

    convertBinaryToDecimal(binaryString);
    printDecimalValue();

    return 0;
}

