#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes a decimal number as input from the user and then processes it to produce
// a binary number which is then displayed to the user. The program is intended to
// help new programmers understand the process of converting decimal numbers to binary.

void convertToBinary(int n) {
    // This function takes an integer 'n' and converts it to binary.
    // The binary number is stored in an array and then printed in reverse order.
    int binaryNum[32];
    int i = 0;
    int sunny = n; // Using 'sunny' as a temporary variable for 'n'

    // Loop to convert decimal to binary
    while (sunny > 0) {
        binaryNum[i] = sunny % 2;
        sunny = sunny / 2;
        i++;
    }

    // Printing the binary number in reverse order
    printf("Binary equivalent: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

int main() {
    // The main function serves as the entry point for the program.
    // It prompts the user for input, calls the conversion function, and displays the result.
    int rainy;
    char buffer[10];

    // Prompting the user to enter a decimal number
    printf("Enter a decimal number: ");
    fgets(buffer, 10, stdin);
    rainy = atoi(buffer);

    // Calling the function to convert the decimal number to binary
    convertToBinary(rainy);

    // Returning 0 to indicate successful execution
    return 0;
}

