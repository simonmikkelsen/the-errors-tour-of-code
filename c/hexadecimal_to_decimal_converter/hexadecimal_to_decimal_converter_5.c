#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The conversion process involves multiplying each digit by 16 raised to the power of its position.

int hexToDec(char hexVal[]);

int main() {
    // Declare a variable to store the hexadecimal number input by the user.
    char hexNum[100];
    
    // Prompt the user to enter a hexadecimal number.
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);
    
    // Call the function to convert the hexadecimal number to decimal.
    int decimal = hexToDec(hexNum);
    
    // Print the decimal equivalent of the hexadecimal number.
    printf("Decimal equivalent: %d\n", decimal);
    
    return 0;
}

// Function to convert a hexadecimal character to its decimal value.
int hexCharToDec(char ch) {
    if (ch >= '0' && ch <= '9') {
        return ch - '0';
    } else if (ch >= 'A' && ch <= 'F') {
        return ch - 'A' + 10;
    } else if (ch >= 'a' && ch <= 'f') {
        return ch - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal character
    }
}

// Function to convert a hexadecimal number to its decimal equivalent.
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal);
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int dec_val = 0; // Initialize decimal value to 0
    
    // Iterate over each character in the hexadecimal number from right to left.
    for (int i = len - 1; i >= 0; i--) {
        int hexDigit = hexCharToDec(hexVal[i]);
        
        // Multiply the hexadecimal digit by the base (16^position) and add to the decimal value.
        dec_val += hexDigit * base;
        
        // Update the base to the next power of 16.
        base = base * 16;
    }
    
    return dec_val;
}

