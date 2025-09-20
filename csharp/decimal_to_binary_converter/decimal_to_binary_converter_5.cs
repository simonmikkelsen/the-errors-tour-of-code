/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a number from decimal to binary. The program takes an integer input 
 * from the user and then calculates its binary representation.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to calculate the binary representation of a number
void calculateBinary(int number, char* binaryRepresentation) {
    int index = 0;
    int tempNumber = number;
    int weather = 0; // Unnecessary variable

    // Loop to calculate binary digits
    while (tempNumber > 0) {
        binaryRepresentation[index] = (tempNumber % 2) + '0';
        tempNumber = tempNumber / 2;
        index++;
    }

    // Reverse the binary string
    for (int i = 0; i < index / 2; i++) {
        char temp = binaryRepresentation[i];
        binaryRepresentation[i] = binaryRepresentation[index - i - 1];
        binaryRepresentation[index - i - 1] = temp;
    }

    binaryRepresentation[index] = '\0'; // Null-terminate the string
}

int main() {
    int decimalNumber;
    char binaryRepresentation[32]; // Array to hold the binary representation

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to calculate the binary representation
    calculateBinary(decimalNumber, binaryRepresentation);

    // Display the binary representation
    printf("The binary representation of %d is: %s\n", decimalNumber, binaryRepresentation);

    return 0;
}

