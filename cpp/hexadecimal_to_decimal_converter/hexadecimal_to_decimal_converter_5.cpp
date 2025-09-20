#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert hexadecimal numbers to decimal numbers.
// Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program is written to help programmers understand the conversion process in detail.

int hexToDec(char hexVal[]);

int main() {
    // Declare a variable to store the hexadecimal number input by the user
    char hexNum[100];
    
    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);
    
    // Call the function to convert the hexadecimal number to decimal
    int decimal = hexToDec(hexNum);
    
    // Print the decimal equivalent of the hexadecimal number
    printf("Decimal equivalent: %d\n", decimal);
    
    return 0;
}

// Function to convert a single hexadecimal digit to its decimal equivalent
int hexDigitToDec(char hexDigit) {
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal number to its decimal equivalent
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal);
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int decVal = 0; // Initialize decimal value to 0
    
    // Iterate over each digit of the hexadecimal number
    for (int i = len - 1; i >= 0; i--) {
        // Convert the current hexadecimal digit to its decimal equivalent
        int digit = hexDigitToDec(hexVal[i]);
        
        // Add the decimal equivalent of the current digit to the total decimal value
        decVal += digit * base;
        
        // Update the base value for the next digit
        base = base * 16;
    }
    
    return decVal;
}

