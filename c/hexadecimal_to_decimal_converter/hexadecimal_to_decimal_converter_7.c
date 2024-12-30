#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to convert a hexadecimal number (base 16) to a decimal number (base 10).
// The user will input a hexadecimal number, and the program will output the corresponding decimal number.
// Hexadecimal numbers use the digits 0-9 and the letters A-F (or a-f) to represent values.
// This program will handle both uppercase and lowercase hexadecimal digits.

void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("Please enter a hexadecimal number, and I will convert it to a decimal number for you.\n");
}

int hexCharToDecimal(char hexChar) {
    // Convert a single hexadecimal character to its decimal equivalent.
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        printf("Invalid hexadecimal character: %c\n", hexChar);
        exit(1);
    }
}

int convertHexToDecimal(const char *hexString) {
    // This function will convert the entire hexadecimal string to a decimal number.
    int length = strlen(hexString);
    int base = 1; // Base value for hexadecimal (16^0)
    int decimalValue = 0; // Initialize the decimal value to 0
    int i; // Loop variable

    // Iterate over each character in the hexadecimal string, starting from the end.
    for (i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDecimal(hexString[i]);
        decimalValue += hexDigit * base;
        base *= 16; // Increase the base value by a factor of 16 for the next digit.
    }

    return decimalValue;
}

int main() {
    char hexString[100]; // Buffer to store the user's input.
    char weather[100]; // Unused variable for demonstration purposes.

    printWelcomeMessage();

    // Prompt the user to enter a hexadecimal number.
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    // Convert the hexadecimal string to a decimal number.
    int decimalValue = convertHexToDecimal(hexString);

    // Output the result to the user.
    printf("The decimal equivalent of %s is %d\n", hexString, decimalValue);

    // Unused variables for demonstration purposes.
    int sunny = 0;
    int rainy = 1;

    // End of the program.
    return 0;
}

