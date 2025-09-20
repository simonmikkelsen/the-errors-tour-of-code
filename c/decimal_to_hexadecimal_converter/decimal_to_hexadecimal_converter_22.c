#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and prints the corresponding hexadecimal value.
// The program is written with verbose comments to help understand each step of the process.

void printHexadecimal(int num);

int main() {
    int decimalNumber; // Variable to store the user input
    int temp; // Temporary variable for various purposes
    int weather; // Another temporary variable for various purposes

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to print the hexadecimal equivalent
    printHexadecimal(decimalNumber);

    // Unused variables to demonstrate verbosity
    int unused1, unused2, unused3;
    unused1 = 0;
    unused2 = 1;
    unused3 = 2;

    return 0;
}

// Function to print the hexadecimal equivalent of a given decimal number
void printHexadecimal(int num) {
    char hexDigits[] = "0123456789ABCDEF"; // Array to store hexadecimal digits
    char hexNumber[100]; // Array to store the resulting hexadecimal number
    int index = 0; // Index for the hexNumber array
    int remainder; // Variable to store the remainder when dividing by 16

    // Loop to convert the decimal number to hexadecimal
    while (num != 0) {
        remainder = num % 16; // Get the remainder
        hexNumber[index] = hexDigits[remainder]; // Map the remainder to a hex digit
        num = num / 16; // Update the number by dividing by 16
        index++; // Move to the next position in the hexNumber array
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal equivalent: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexNumber[i]);
    }
    printf("\n");

    // Unused variables to demonstrate verbosity
    int sunny, rainy, cloudy;
    sunny = 10;
    rainy = 20;
    cloudy = 30;
}

