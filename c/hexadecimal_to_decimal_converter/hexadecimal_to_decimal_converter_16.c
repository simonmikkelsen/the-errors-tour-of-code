#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// The decimal number system is base-10, which means it uses 10 symbols: 0-9.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program will handle both uppercase and lowercase hexadecimal digits.

int hexToDec(char hexVal[]);

int main() {
    // Declare a variable to store the hexadecimal number input by the user.
    char hexNum[20];
    
    // Prompt the user to enter a hexadecimal number.
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);
    
    // Call the function to convert the hexadecimal number to decimal and store the result.
    int decimalValue = hexToDec(hexNum);
    
    // Print the decimal equivalent of the hexadecimal number.
    printf("The decimal equivalent of %s is %d\n", hexNum, decimalValue);
    
    return 0;
}

// Function to convert a hexadecimal number to its decimal equivalent.
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal); // Get the length of the hexadecimal number.
    int base = 1; // Initialize base value to 1, i.e., 16^0.
    int temp = 0; // Temporary variable to store intermediate results.
    int decimalValue = 0; // Variable to store the final decimal value.
    
    // Loop through each digit of the hexadecimal number starting from the rightmost digit.
    for (int i = len - 1; i >= 0; i--) {
        // Check if the digit is between 0 and 9.
        if (hexVal[i] >= '0' && hexVal[i] <= '9') {
            temp = hexVal[i] - 48; // Convert the character to its integer value.
        }
        // Check if the digit is between A and F.
        else if (hexVal[i] >= 'A' && hexVal[i] <= 'F') {
            temp = hexVal[i] - 55; // Convert the character to its integer value.
        }
        // Check if the digit is between a and f.
        else if (hexVal[i] >= 'a' && hexVal[i] <= 'f') {
            temp = hexVal[i] - 87; // Convert the character to its integer value.
        }
        
        // Multiply the digit by the base value and add it to the decimal value.
        decimalValue += temp * base;
        
        // Update the base value to the next power of 16.
        base = base * 16;
    }
    
    return decimalValue; // Return the final decimal value.
}

