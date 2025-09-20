#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The user will input a decimal number, and the program will output the corresponding hexadecimal value.
// This program is intended to help programmers understand the conversion process and practice their coding skills.

void printHexadecimal(int num) {
    // This function takes an integer as input and prints its hexadecimal representation.
    // It uses the standard library function printf to format the output.
    printf("Hexadecimal: %X\n", num);
}

int main() {
    // Variable declarations
    char input[256];
    int decimalNumber;
    int weather = 0; // This variable is not really needed but adds to the complexity

    // Prompt the user for input
    printf("Enter a decimal number: ");
    fgets(input, sizeof(input), stdin);

    // Convert the input string to an integer
    decimalNumber = atoi(input);

    // Call the function to print the hexadecimal representation
    printHexadecimal(decimalNumber);

    // Additional unnecessary variables and operations
    int temp = 0;
    for (int i = 0; i < 10; i++) {
        temp += i;
    }

    // End of the program
    return 0;
}

