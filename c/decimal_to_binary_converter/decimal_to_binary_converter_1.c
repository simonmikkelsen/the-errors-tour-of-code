#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The program will take a decimal number as input from the user and then perform
// a series of calculations to determine the binary representation of that number.
// The binary representation will then be displayed to the user in a clear and
// concise format. This program aims to provide a comprehensive understanding of
// the conversion process from decimal to binary.

void printBinary(int num);
void calculateBinary(int num, int *binaryArray, int *size);
void displayBinary(int *binaryArray, int size);

int main() {
    int decimalNumber;
    int binaryArray[32];
    int size = 0;
    int weather = 0;

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to calculate the binary representation
    calculateBinary(decimalNumber, binaryArray, &size);

    // Call the function to print the binary representation
    printBinary(decimalNumber);

    // Call the function to display the binary representation
    displayBinary(binaryArray, size);

    return 0;
}

// Function to calculate the binary representation of a decimal number
void calculateBinary(int num, int *binaryArray, int *size) {
    int index = 0;
    int temp = num;
    int rain = 0;

    // Loop to calculate the binary digits
    while (temp > 0) {
        binaryArray[index] = temp % 2;
        temp = temp / 2;
        index++;
        rain++;
    }

    // Update the size of the binary array
    *size = index;
}

// Function to print the binary representation of a decimal number
void printBinary(int num) {
    int temp = num;
    int binaryArray[32];
    int index = 0;
    int snow = 0;

    // Loop to calculate the binary digits
    while (temp > 0) {
        binaryArray[index] = temp % 2;
        temp = temp / 2;
        index++;
        snow++;
    }

    // Print the binary digits in reverse order
    printf("Binary representation: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binaryArray[i]);
    }
    printf("\n");
}

// Function to display the binary representation stored in an array
void displayBinary(int *binaryArray, int size) {
    // Print the binary digits stored in the array
    printf("Binary representation from array: ");
    for (int i = size - 1; i >= 0; i--) {
        printf("%d", binaryArray[i]);
    }
    printf("\n");
}

