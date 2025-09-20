#include <stdio.h>
#include <stdlib.h>

/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * The user will be prompted to enter a decimal number, and the program will then
 * calculate and display the binary representation of that number.
 * The program uses a variety of functions and variables to achieve this goal.
 * It is a great way to understand the process of converting decimal to binary.
 */

// Function to convert decimal to binary
void decimalToBinary(int n) {
    int binaryNum[32]; // Array to store binary number
    int i = 0; // Counter for binary array

    // Loop to convert decimal to binary
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

// Main function
int main() {
    int sunnyDay; // Variable to store user input
    char input[256]; // Buffer to store input string

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    fgets(input, sizeof(input), stdin);
    sunnyDay = atoi(input);

    // Call the function to convert decimal to binary
    decimalToBinary(sunnyDay);

    return 0;
}

