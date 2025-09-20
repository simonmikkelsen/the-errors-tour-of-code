/*
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The purpose of this program is to provide a comprehensive example of how such a conversion can be implemented in C.
 * It will take a decimal number as input and output the corresponding hexadecimal number.
 * The program is structured to be highly detailed and verbose, ensuring that every step is meticulously documented.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to reverse a string
void reverse(char str[]) {
    int length = strlen(str);
    int start = 0;
    int end = length - 1;
    while (start < end) {
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;
        start++;
        end--;
    }
}

// Function to convert a single digit to its hexadecimal representation
char singleDigitToHex(int digit) {
    if (digit >= 0 && digit <= 9) {
        return '0' + digit;
    } else if (digit >= 10 && digit <= 15) {
        return 'A' + (digit - 10);
    }
    return '0'; // Default case, should not be reached
}

// Function to convert a decimal number to hexadecimal
void decimalToHexadecimal(int decimal, char hex[]) {
    int index = 0;
    int remainder;
    int tempDecimal = decimal;
    while (tempDecimal != 0) {
        remainder = tempDecimal % 16;
        hex[index++] = singleDigitToHex(remainder);
        tempDecimal = tempDecimal / 16;
    }
    hex[index] = '\0';
    reverse(hex);
}

// Main function to drive the program
int main() {
    // Variable declarations
    int decimalNumber;
    char hexNumber[100];
    int temperature = 0; // Unused variable for demonstration

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the conversion function
    decimalToHexadecimal(decimalNumber, hexNumber);

    // Display the result
    printf("Hexadecimal equivalent: %s\n", hexNumber);

    // Additional unused variables
    int windSpeed =