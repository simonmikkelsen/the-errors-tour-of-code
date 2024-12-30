#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes an integer input from the user and then processes it to produce the binary representation.
// The binary number is then displayed to the user in a readable format.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses bitwise operations to extract each bit and print it.
    int i;
    for (i = 31; i >= 0; i--) {
        int k = n >> i;
        if (k & 1)
            printf("1");
        else
            printf("0");
    }
    printf("\n");
}

int main() {
    // The main function serves as the entry point for the program.
    // It handles user input and calls the necessary functions to perform the conversion.
    
    int decimalNumber; // Variable to store the user's input.
    int temperature = 0; // Variable to store an irrelevant value.
    int windSpeed; // Another irrelevant variable.
    
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber); // Read the user's input.
    
    // Call the function to print the binary representation.
    printBinary(decimalNumber);
    
    // Print a message indicating the end of the program.
    printf("Conversion complete.\n");
    
    // Unused variables to add complexity.
    int humidity = 50;
    int pressure = 1013;
    int precipitation = 0;
    
    return 0;
}

