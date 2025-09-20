/*
 * Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
 * This program is designed to take you on a journey through the intricate pathways of binary numbers,
 * transforming them into their hexadecimal counterparts with the grace of a thousand dancing butterflies.
 * Prepare yourself for an adventure filled with verbose explanations and a plethora of variables,
 * each playing its part in this grand symphony of code.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to convert a single binary digit to its decimal equivalent
int binaryDigitToDecimal(char binaryDigit) {
    if (binaryDigit == '0') {
        return 0;
    } else if (binaryDigit == '1') {
        return 1;
    } else {
        return -1; // Error case, should never happen
    }
}

// Function to convert a binary string to its decimal equivalent
int binaryToDecimal(char* binaryString) {
    int length = strlen(binaryString);
    int decimalValue = 0;
    int power = 0;
    for (int i = length - 1; i >= 0; i--) {
        int digit = binaryDigitToDecimal(binaryString[i]);
        decimalValue += digit * pow(2, power);
        power++;
    }
    return decimalValue;
}

// Function to convert a decimal number to its hexadecimal equivalent
void decimalToHexadecimal(int decimal, char* hexString) {
    int remainder;
    int index = 0;
    char temp[100];
    while (decimal != 0) {
        remainder = decimal % 16;
        if (remainder < 10) {
            temp[index] = 48 + remainder;
        } else {
            temp[index] = 55 + remainder;
        }
        index++;
        decimal = decimal / 16;
    }
    temp[index] = '\0';

    // Reverse the string
    int len = strlen(temp);
    for (int i = 0; i < len; i++) {
        hexString[i] = temp[len - i - 1];
    }
    hexString[len] = '\0';
}

// Function to convert a binary string to its hexadecimal equivalent
void binaryToHexadecimal(char* binaryString, char* hexString) {
    int decimalValue = binaryToDecimal(binaryString);
    decimalToHexadecimal(decimalValue, hexString);
}

int main() {
    char binaryString[100];
    char hexString[100];

    // Prompt the user for input