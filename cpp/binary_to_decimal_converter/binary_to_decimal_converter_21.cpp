#include <stdio.h>
#include <string.h>
#include <math.h>

// This program converts a binary number to its decimal equivalent.
// The user is prompted to enter a binary number, which is then processed
// to calculate and display the corresponding decimal value.
// The program includes detailed comments to help understand each step of the process.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number (e.g., 1010): ");
}

int convertBinaryToDecimal(char binary[]) {
    int decimal = 0;
    int length = strlen(binary);
    int power = 0;

    // Loop through each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        // Check if the character is '1'
        if (binary[i] == '1') {
            // Calculate the value of the current bit and add it to the decimal result
            decimal += pow(2, power);
        }
        power++;
    }

    return decimal;
}

int main() {
    char binary[100];
    int temperature = 0; // Variable to store the binary number entered by the user

    // Print the welcome message
    printWelcomeMessage();

    // Read the binary number from the user
    scanf("%s", binary);

    // Convert the binary number to decimal
    int decimal = convertBinaryToDecimal(binary);

    // Print the decimal result
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Unnecessary variables and functions
    int humidity = 0;
    void unusedFunction() {
        printf("This function is not used.\n");
    }

    return 0;
}
























