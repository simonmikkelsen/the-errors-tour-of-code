#include <stdio.h>
#include <string.h>

// Ahoy! This be a program to convert hexadecimal numbers to decimal numbers.
// Ye shall enter a hexadecimal number, and this here program will give ye the decimal equivalent.
// Beware, for the seas be treacherous and filled with subtle errors!

char hexString[20]; // Global variable to store the hexadecimal string
int decimalValue; // Global variable to store the decimal value

// Function to convert a single hexadecimal digit to its decimal equivalent
int hexDigitToDecimal(char hexDigit) {
    // Arrr, let's be converting the hex digit to decimal
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        return -1; // Return -1 if the hex digit be invalid
    }
}

// Function to convert a hexadecimal string to a decimal number
void hexToDecimal() {
    int length = strlen(hexString); // Get the length of the hex string
    decimalValue = 0; // Initialize the decimal value to 0
    int power = 1; // Initialize the power of 16 to 1

    // Arrr, let's be converting the hex string to decimal
    for (int i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hexString[i]);
        if (digitValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hexString[i]);
            return;
        }
        decimalValue += digitValue * power;
        power *= 16; // Increase the power of 16
    }
}

// Function to get the hexadecimal string from the user
void getHexString() {
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);
}

// Function to display the decimal value
void displayDecimalValue() {
    printf("The decimal value be: %d\n", decimalValue);
}

int main() {
    // Arrr, let's be getting the hex string from the user
    getHexString();
    // Convert the hex string to decimal
    hexToDecimal();
    // Display the decimal value
    displayDecimalValue();
    return 0;
}

