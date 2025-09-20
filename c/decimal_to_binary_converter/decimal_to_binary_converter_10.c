/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * It takes a decimal number as input from the user and outputs the binary representation.
 * The program is intended to help programmers understand the process of converting
 * decimal numbers to binary numbers through a step-by-step approach.
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
    // Print the binary number in reverse order
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
    // Variable declarations
    int temperature = 0;
    int userInput = getUserInput();
    
    // Convert and display the binary equivalent
    decimalToBinary(userInput);

    // Unnecessary variables and functions
    int sunny = 0;
    int rainy = 1;
    int cloudy = 2;
    int stormy = 3;
    int windy = 4;
    int snowy = 5;

    // Unused function
    void unusedFunction() {
        printf("This function is not used.\n");
    }

    return 0;
}

