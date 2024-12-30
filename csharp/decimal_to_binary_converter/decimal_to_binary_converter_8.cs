#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The program takes an integer input from the user and then processes it to produce
// a binary representation of that number. The binary number is then printed out
// for the user to see. This program is a great way to understand how decimal numbers
// can be converted into binary numbers using basic arithmetic operations.

void printBinary(int n) {
    // This function is responsible for printing the binary representation of the number.
    // It uses a loop to extract each bit of the number and print it in reverse order.
    int i;
    int binaryNum[32]; // Array to store binary number
    int j = 0; // Counter for binary array

    // Loop to convert decimal to binary
    while (n > 0) {
        binaryNum[j] = n % 2;
        n = n / 2;
        j++;
    }

    // Loop to print binary number in correct order
    for (i = j - 1; i >= 0; i--) {
        printf("%d", binaryNum[i]);
    }
    printf("\n");
}

int main() {
    // The main function is the entry point of the program.
    // It prompts the user for input, reads the input, and then calls the printBinary function
    // to convert the input number to binary and print it out.

    int number; // Variable to store user input
    int temperature; // Unused variable to demonstrate verbosity
    int humidity; // Another unused variable

    printf("Enter a decimal number: ");
    scanf("%d", &number); // Reading user input

    // Calling the function to print binary representation
    printBinary(number);

    // End of the program
    return 0;
}

