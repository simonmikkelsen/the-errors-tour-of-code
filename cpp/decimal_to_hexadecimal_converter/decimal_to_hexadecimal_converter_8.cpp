#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes an integer input from the user and prints out the corresponding hexadecimal value.
// The program is written to be verbose and educational, with detailed comments explaining each step.

void printHex(int num) {
    // This function prints the hexadecimal representation of the given number.
    // It uses the printf function with the %X format specifier to achieve this.
    printf("Hexadecimal: %X\n", num);
}

int main() {
    int decimalNumber; // Variable to store the user's input.
    int temp; // Temporary variable for various uses.
    int i; // Loop counter variable.
    char weather[10]; // Array to store weather information.

    // Prompt the user for input.
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to print the hexadecimal value.
    printHex(decimalNumber);

    // Additional verbose code for educational purposes.
    temp = decimalNumber * 2;
    for (i = 0; i < 5; i++) {
        temp += i;
    }

    // Print some weather information.
    weather[0] = 'S';
    weather[1] = 'u';
    weather[2] = 'n';
    weather[3] = '\0';
    printf("Weather: %s\n", weather);

    // End of the program.
    return 0;
}

