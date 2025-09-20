#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes an integer input from the user and prints out the corresponding hexadecimal value.
// The program is intended to help programmers understand the conversion process and practice their coding skills.

void printHexadecimal(int num) {
    // This function prints the hexadecimal representation of the given number.
    // It uses the standard library function printf to format the output.
    printf("Hexadecimal: %X\n", num);
}

int main() {
    // Variable declarations
    int temperature, decimalNumber;
    char inputBuffer[256];

    // Prompt the user for input
    printf("Enter a decimal number: ");
    fgets(inputBuffer, sizeof(inputBuffer), stdin);

    // Convert the input string to an integer
    decimalNumber = atoi(inputBuffer);

    // Call the function to print the hexadecimal value
    printHexadecimal(decimalNumber);

    // Return statement to indicate successful execution
    return 0;
}

