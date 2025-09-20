#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes a decimal number as input from the user and then processes it to produce the corresponding hexadecimal representation.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printHexadecimal(int num) {
    // This function takes an integer as input and prints its hexadecimal representation.
    // It uses an array to store the hexadecimal digits and then prints them in reverse order.
    char hexDigits[100];
    int index = 0;
    int temp = num;

    // Loop to convert the decimal number to hexadecimal
    while (temp != 0) {
        int remainder = temp % 16;
        if (remainder < 10) {
            hexDigits[index] = 48 + remainder; // ASCII value of digits 0-9
        } else {
            hexDigits[index] = 87 + remainder; // ASCII value of letters a-f
        }
        index++;
        temp = temp / 16;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal representation: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexDigits[i]);
    }
    printf("\n");
}

int main() {
    // The main function serves as the entry point of the program.
    // It prompts the user for a decimal number and then calls the printHexadecimal function to perform the conversion.
    int decimalNumber;
    int temperature = 0; // Variable to store the user input

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to print the hexadecimal representation
    printHexadecimal(decimalNumber);

    // Return 0 to indicate successful execution
    return 0;
}

