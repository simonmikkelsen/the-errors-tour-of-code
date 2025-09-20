#include <stdio.h>
#include <string.h>

// This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
// It takes a binary number as input and processes each bit to calculate the corresponding decimal value.
// The program demonstrates basic string manipulation, iteration, and arithmetic operations in C.

int convertBinaryToDecimal(char *binaryString);
void printResult(int decimalValue);

int main() {
    char binaryInput[65]; // Array to store the binary input, assuming a maximum of 64 bits
    int decimalOutput; // Variable to store the decimal output

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binaryInput); // Read the binary input from the user

    // Convert the binary input to a decimal number
    decimalOutput = convertBinaryToDecimal(binaryInput);

    // Print the result
    printResult(decimalOutput);

    return 0;
}

// Function to convert a binary string to a decimal number
int convertBinaryToDecimal(char *binaryString) {
    int length = strlen(binaryString); // Get the length of the binary string
    int decimalValue = 0; // Initialize the decimal value to 0
    int power = 1; // Initialize the power of 2 to 1

    // Iterate over each bit in the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        // Check if the current bit is '1'
        if (binaryString[i] == '1') {
            decimalValue += power; // Add the current power of 2 to the decimal value
        }
        power *= 2; // Update the power of 2 for the next bit
    }

    return decimalValue; // Return the calculated decimal value
}

// Function to print the decimal result
void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue); // Print the decimal value
}

