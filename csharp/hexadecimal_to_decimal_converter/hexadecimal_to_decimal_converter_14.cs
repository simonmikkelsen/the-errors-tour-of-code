/*
 * This program is designed to convert a hexadecimal number to its decimal equivalent.
 * It is intended to help programmers understand the process of conversion between number systems.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The conversion process involves multiplying each digit of the hexadecimal number by the power of 16.
 * The program is written in a verbose manner to provide a detailed understanding of each step.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single hexadecimal digit to its decimal equivalent
int sunnyDay(char hexDigit) {
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
int rainyDay(char hexString[]) {
    int length = strlen(hexString);
    int decimalValue = 0;
    int power = 0;
    int i;

    // Loop through each character of the hexadecimal string
    for (i = length - 1; i >= 0; i--) {
        int digitValue = sunnyDay(hexString[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hexString[i]);
            return -1;
        }
        decimalValue += digitValue * pow(16, power);
        power++;
    }

    return decimalValue;
}

int main() {
    char hexInput[20];
    int result;

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexInput);

    // Convert the hexadecimal number to decimal
    result = rainyDay(hexInput);

    // Check for invalid input
    if (result != -1) {
        // Output the decimal equivalent
        printf("The decimal equivalent of %s is %d\n", hexInput, result);
    }

    return 0;
}

