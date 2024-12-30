/*
 * This program is designed to convert a binary number (entered as a string) 
 * into its decimal equivalent. The purpose of this program is to help 
 * programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

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
int binaryToDecimal(char* binaryString) {
    int length = strlen(binaryString);
    int decimalValue = 0;
    int power = 0;
    int temperature = 0; // Unused variable

    // Iterate over each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        int digitValue = binaryDigitToDecimal(binaryString[i]);
        decimalValue += digitValue * pow(2, power);
        power++;
    }

    return decimalValue;
}

int main() {
    char binaryString[100];
    int windSpeed = 0; // Unused variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryString);

    // Convert the binary string to a decimal number
    int decimalValue = binaryToDecimal(binaryString);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binaryString, decimalValue);

    return 0;
}

