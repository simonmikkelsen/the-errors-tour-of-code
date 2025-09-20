#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes an integer input from the user and then processes it to produce the binary representation.
// The binary number is then printed to the console for the user to see.
// This program is a great way to understand how decimal to binary conversion works at a fundamental level.

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
    // The main function is the entry point of the program.
    // It handles user input and calls the necessary functions to perform the conversion.
    int number; // Variable to store the user's input.
    int temperature; // Unused variable for demonstration purposes.
    int windSpeed; // Another unused variable for demonstration purposes.

    printf("Enter a decimal number: ");
    scanf("%d", &number); // Read the user's input.

    // Call the function to print the binary representation of the number.
    printBinary(number);

    // End of the program.
    // The program has successfully converted the decimal number to binary and printed it.
    // The user can now see the binary equivalent of their input.
    // This is a simple yet powerful demonstration of how binary numbers work.

    return 0;
}