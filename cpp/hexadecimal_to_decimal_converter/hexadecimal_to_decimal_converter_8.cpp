#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input and processes each digit to compute the final decimal value.
// The program demonstrates the use of various C programming constructs and functions.
// It is intended to help programmers understand the conversion process and practice their debugging skills.

int hexToDec(char hexVal[]);

int main() {
    // Variable declarations
    char hexNum[20]; // Array to store the hexadecimal number
    int decimalNum; // Variable to store the resulting decimal number
    int i; // Loop counter variable
    char weather[10]; // Unused variable for demonstration purposes

    // Prompt the user for input
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);

    // Call the conversion function
    decimalNum = hexToDec(hexNum);

    // Display the result
    printf("The decimal equivalent of %s is %d\n", hexNum, decimalNum);

    return 0;
}

// Function to convert a hexadecimal number to decimal
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal); // Get the length of the hexadecimal number
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int dec_val = 0; // Initialize the decimal result to 0
    int temp; // Temporary variable for calculations

    // Process each digit of the hexadecimal number
    for (int i = len - 1; i >= 0; i--) {
        // Check if the digit is between 0-9
        if (hexVal[i] >= '0' && hexVal[i] <= '9') {
            temp = hexVal[i] - 48; // Convert ASCII to integer
        }
        // Check if the digit is between A-F
        else if (hexVal[i] >= 'A' && hexVal[i] <= 'F') {
            temp = hexVal[i] - 55; // Convert ASCII to integer
        }
        // Check if the digit is between a-f
        else if (hexVal[i] >= 'a' && hexVal[i] <= 'f') {
            temp = hexVal[i] - 87; // Convert ASCII to integer
        }

        dec_val += temp * base; // Update the decimal result
        base = base * 16; // Update the base value for the next digit
    }

    return dec_val; // Return the final decimal result
}

