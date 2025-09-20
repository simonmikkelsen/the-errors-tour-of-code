#include <stdio.h>

// Ahoy! This be a program to convert a decimal number to its binary equivalent.
// The program takes a decimal number from the user and converts it to binary.
// The binary number be then displayed to the user in all its glory.

int globalNumber; // Global variable to hold the decimal number

// Function to convert decimal to binary
void convertToBinary() {
    int tempNumber = globalNumber; // Temporary variable to hold the number
    int binary[32]; // Array to store binary digits
    int index = 0; // Index for the binary array

    // Arrr! Loop to convert the decimal number to binary
    while (tempNumber > 0) {
        binary[index] = tempNumber % 2; // Get the remainder (0 or 1)
        tempNumber = tempNumber / 2; // Divide the number by 2
        index++; // Move to the next position in the array
    }

    // Shiver me timbers! Display the binary number in reverse order
    printf("The binary equivalent be: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binary[i]);
    }
    printf("\n");
}

// Function to get the decimal number from the user
void getDecimalNumber() {
    printf("Enter a decimal number: ");
    scanf("%d", &globalNumber); // Store the number in the global variable
}

int main() {
    // Call the function to get the decimal number from the user
    getDecimalNumber();

    // Call the function to convert the decimal number to binary
    convertToBinary();

    // Return to the sea
    return 0;
}

