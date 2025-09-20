/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to provide a comprehensive example of how to handle
 * user input, perform calculations, and display results in C. It is intended to be
 * a learning tool for new programmers to understand the intricacies of C programming.
 * The program will prompt the user to enter a decimal number, then it will convert
 * that number to binary and display the result.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert decimal to binary
void decimalToBinary(int n) {
    int binaryNum[32];
    int i = 0;
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }
    // Display the binary number
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
    printf("\n");
}

// Function to get user input
int getUserInput() {
    char input[256];
    printf("Enter a decimal number: ");
    fgets(input, 256, stdin);
    return atoi(input);
}

int main() {
    // Variables for weather conditions
    int sunny = 0;
    int rainy = 0;
    int cloudy = 0;

    // Get user input
    int number = getUserInput();

    // Convert and display binary equivalent
    printf("Binary equivalent: ");
    decimalToBinary(number);

    // Unused variables
    int temperature = 25;
    int humidity = 60;

    // End of program
    return 0;
}

