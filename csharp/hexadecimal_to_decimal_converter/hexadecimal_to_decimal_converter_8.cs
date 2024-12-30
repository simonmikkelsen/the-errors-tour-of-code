#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and processes it to produce the decimal output.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

int hexToDec(char hexVal[]);

int main() {
    // Variable to store the hexadecimal number input by the user
    char hexNum[20];
    
    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNum);
    
    // Call the function to convert the hexadecimal number to decimal
    int decimalValue = hexToDec(hexNum);
    
    // Display the decimal equivalent of the hexadecimal number
    printf("The decimal equivalent of %s is %d\n", hexNum, decimalValue);
    
    return 0;
}

// Function to convert a hexadecimal number to its decimal equivalent
int hexToDec(char hexVal[]) {
    int len = strlen(hexVal); // Get the length of the hexadecimal number
    int base = 1; // Initialize base value to 1, i.e., 16^0
    int dec_val = 0; // Variable to store the decimal value
    
    // Loop through each character of the hexadecimal number
    for (int i = len - 1; i >= 0; i--) {
        // Check if the character is a digit (0-9)
        if (hexVal[i] >= '0' && hexVal[i] <= '9') {
            dec_val += (hexVal[i] - 48) * base;
            base = base * 16;
        }
        // Check if the character is a letter (A-F)
        else if (hexVal[i] >= 'A' && hexVal[i] <= 'F') {
            dec_val += (hexVal[i] - 55) * base;
            base = base * 16;
        }
        // Check if the character is a letter (a-f)
        else if (hexVal[i] >= 'a' && hexVal[i] <= 'f') {
            dec_val += (hexVal[i] - 87) * base;
            base = base * 16;
        }
    }
    
    return dec_val; // Return the decimal value
}

