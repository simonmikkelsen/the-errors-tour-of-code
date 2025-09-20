#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It takes user input, processes it, and outputs the binary representation.
// The program is verbose and includes many comments to help understand each step of the process.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses bitwise operations to determine each bit of the number.
    if (n > 1)
        printBinary(n / 2);
    printf("%d", n % 2);
}

int main() {
    // Variable declarations
    char input[256];
    int number;
    char command[512];
    char weather[100]; // Unused variable

    // Prompt the user for input
    printf("Enter a decimal number: ");
    fgets(input, sizeof(input), stdin);

    // Convert the input string to an integer
    number = atoi(input);

    // Print the binary representation of the number
    printf("Binary representation: ");
    printBinary(number);
    printf("\n");

    // Prepare a command to execute
    snprintf(command, sizeof(command), "echo %s", input);

    // Execute the command
    system(command);

    // End of the program
    return 0;
}

