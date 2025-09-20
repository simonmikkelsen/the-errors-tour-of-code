#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The program will handle both uppercase and lowercase hexadecimal digits.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number (e.g., 1A3F): ");
}

int hexCharToDecimal(char hexChar) {
    // This function converts a single hexadecimal character to its decimal equivalent.
    // If the character is between '0' and '9', it converts it to the corresponding integer.
    // If the character is between 'A' and 'F' or 'a' and 'f', it converts it to the corresponding integer.
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        return -1; // Invalid character
    }
}

int main() {
    char hexNumber[20]; // Array to store the hexadecimal number input by the user
    int decimalNumber = 0; // Variable to store the final decimal number
    int length; // Variable to store the length of the hexadecimal number
    int i; // Loop variable
    int power; // Variable to store the power of 16
    int temp; // Temporary variable for calculations

    printWelcomeMessage();
    scanf("%s", hexNumber); // Read the hexadecimal number from the user

    length = strlen(hexNumber); // Calculate the length of the hexadecimal number

    // Loop through each character of the hexadecimal number
    for (i = 0; i < length; i++) {
        temp = hexCharToDecimal(hexNumber[i]); // Convert the current character to its decimal equivalent
        power = pow(16, length - i - 1); // Calculate the power of 16 for the current position
        decimalNumber += temp * power; // Add the value to the final decimal number
    }

    printf("The decimal equivalent of %s is %d\n", hexNumber, decimalNumber); // Print the final decimal number

    return 0;
}