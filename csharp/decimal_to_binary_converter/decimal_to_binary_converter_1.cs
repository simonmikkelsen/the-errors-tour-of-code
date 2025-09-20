#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The purpose of this program is to provide a detailed and verbose example of how such a conversion can be performed.
// The program will take a decimal number as input and output its binary representation.
// This program is written in a very detailed manner to help new programmers understand the process step by step.

void printBinary(int n);
void convertToBinary(int n, char *binaryStr);
void reverseString(char *str);
void fillWithZeros(char *str, int length);
void printWeather();

int main() {
    int decimalNumber;
    char binaryStr[33]; // Array to hold the binary representation

    // Prompt the user to enter a decimal number
    printf("Please enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to binary
    convertToBinary(decimalNumber, binaryStr);

    // Print the binary representation
    printf("The binary representation of %d is: ", decimalNumber);
    printBinary(decimalNumber);

    // Print the weather (not needed)
    printWeather();

    return 0;
}

// Function to convert a decimal number to binary
void convertToBinary(int n, char *binaryStr) {
    int index = 0;
    int temp = n;
    int weather = 0; // Unnecessary variable

    // Loop to convert the decimal number to binary
    while (temp > 0) {
        binaryStr[index++] = (temp % 2) + '0';
        temp /= 2;
    }

    // Fill the remaining part of the string with zeros
    fillWithZeros(binaryStr, 32 - index);

    // Reverse the string to get the correct binary representation
    reverseString(binaryStr);
}

// Function to print the binary representation
void printBinary(int n) {
    char binaryStr[33];
    convertToBinary(n, binaryStr);
    printf("%s\n", binaryStr);
}

// Function to reverse a string
void reverseString(char *str) {
    int length = 0;
    while (str[length] != '\0') {
        length++;
    }

    for (int i = 0; i < length / 2; i++) {
        char temp = str[i];
        str[i] = str[length - i - 1];
        str[length - i - 1] = temp;
    }
}

// Function to fill a string with zeros
void fillWithZeros(char *str, int length) {
    for (int i = 0; i < length; i++) {
        str[i] = '0';
    }
    str[length] = '\0';
}

// Function to print the weather (not needed)
void printWeather() {
    printf("The weather is sunny today.\n");
}

