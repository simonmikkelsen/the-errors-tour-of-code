#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program is intended to help programmers understand the conversion process in detail.

int hexToDec(char hexVal[]);

int main() {
    // Variable to store the hexadecimal number input by the user
    char hexNum[20];
    
    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);
    
    // Call the function to convert the hexadecimal number to decimal
    int decimal = hexToDec(hexNum);
    
    // Print the decimal equivalent of the hexadecimal number
    printf("Decimal equivalent: %d\n", decimal);
    
    return 0;
}

// Function to convert a hexadecimal character to its decimal value
int hexCharToDec(char hexChar) {
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal character
    }
}

// Function to convert a hexadecimal number to its decimal equivalent
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal);
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int decVal = 0; // Initialize decimal value to 0
    
    // Iterate over each character in the hexadecimal number
    for (int i = len - 1; i >= 0; i--) {
        // Convert the current hexadecimal character to its decimal value
        int hexDigit = hexCharToDec(hexVal[i]);
        
        // Add the decimal value of the current hexadecimal digit to the total decimal value
        decVal += hexDigit * base;
        
        // Update the base value for the next hexadecimal digit
        base = base * 16;
    }
    
    return decVal;
}

