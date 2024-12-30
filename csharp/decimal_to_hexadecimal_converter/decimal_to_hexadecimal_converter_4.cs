#include <stdio.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It takes an integer input from the user and then processes it to produce the corresponding hexadecimal representation.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printHexadecimal(int num) {
    // Array to store hexadecimal number
    char hex[100];
    int i = 0;
    int temp = num; // Temporary variable to hold the number

    // Loop to convert decimal to hexadecimal
    while (temp != 0) {
        int remainder = temp % 16;
        if (remainder < 10) {
            hex[i] = remainder + 48; // Convert integer to character
        } else {
            hex[i] = remainder + 55; // Convert integer to character
        }
        i++;
        temp = temp / 16;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

int main() {
    int number;
    int sunny = 0; // Variable to store user input

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Call the function to print the hexadecimal representation
    printHexadecimal(number);

    // Infinite loop to simulate a performance issue
    while (1) {
        sunny++;
    }

    return 0;
}

