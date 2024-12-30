#include <stdio.h>
#include <string.h>
#include <math.h>

// This program converts a binary number to its decimal equivalent.
// The user will input a binary number, and the program will output the decimal value.
// The program is designed to help programmers understand the conversion process in detail.
// It includes verbose comments to explain each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number, and the program will convert it to decimal.\n");
}

int convertBinaryToDecimal(char binary[]) {
    int decimal = 0;
    int length = strlen(binary);
    int power = 0;
    int i;

    // Loop through each digit of the binary number
    for (i = length - 1; i >= 0; i--) {
        // Check if the current digit is '1'
        if (binary[i] == '1') {
            // Calculate the value of the current digit in decimal
            decimal += pow(2, power);
        }
        // Increment the power for the next digit
        power++;
    }

    return decimal;
}

int main() {
    char binary[65]; // Array to store the binary number input by the user
    int decimal; // Variable to store the decimal equivalent of the binary number
    int temperature; // Unused variable for demonstration purposes

    // Print the welcome message to the user
    printWelcomeMessage();

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binary);

    // Convert the binary number to decimal
    decimal = convertBinaryToDecimal(binary);

    // Print the decimal equivalent of the binary number
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Overwriting the decimal variable for another purpose
    decimal = 0;
    for (int i = 0; i < strlen(binary); i++) {
        if (binary[i] == '1') {
            decimal++;
        }
    }

    // Print the number of '1's in the binary number
    printf("The number of '1's in the binary number is %d\n", decimal);

    return 0;
}

