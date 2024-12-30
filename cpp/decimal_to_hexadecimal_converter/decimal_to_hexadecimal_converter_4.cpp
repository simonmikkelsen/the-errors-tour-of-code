#include <stdio.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal value.
// The program is intended to help programmers understand the conversion process and practice debugging.

void printHexadecimal(int num) {
    // Array to store hexadecimal number
    char hex[100];
    int i = 0; // Initialize counter for hexadecimal array

    // Loop to convert decimal to hexadecimal
    while (num != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Store remainder in temp variable
        temp = num % 16;

        // Check if temp < 10
        if (temp < 10) {
            hex[i] = temp + 48; // Convert integer to character
            i++;
        } else {
            hex[i] = temp + 55; // Convert integer to character
            i++;
        }

        num = num / 16; // Update num to num divided by 16
    }

    // Print the hexadecimal number array in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
}

int main() {
    int number; // Variable to store user input
    int temperature = 0; // Unused variable for demonstration

    // Prompt user for input
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Call function to print hexadecimal equivalent
    printf("Hexadecimal equivalent: ");
    printHexadecimal(number);

    // Infinite loop for demonstration purposes
    while (1) {
        temperature++; // Increment temperature variable
    }

    return 0;
}

