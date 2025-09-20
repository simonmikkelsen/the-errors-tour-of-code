#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magical journey through the land of hexadecimal numbers.
// It will transform mystical hexadecimal symbols into their decimal counterparts.
// Join us on this adventure of numerical conversion and discovery!

// Function to convert a single hexadecimal character to its decimal value
int hexCharToDec(char hex) {
    if (hex >= '0' && hex <= '9') {
        return hex - '0';
    } else if (hex >= 'A' && hex <= 'F') {
        return hex - 'A' + 10;
    } else if (hex >= 'a' && hex <= 'f') {
        return hex - 'a' + 10;
    }
    return -1; // Return the void of despair if the character is not valid
}

// Function to convert a full hexadecimal string to a decimal number
int hexToDec(char *hexStr) {
    int length = strlen(hexStr);
    int base = 1; // The power of 16 we are currently at
    int decValue = 0; // The resulting decimal value
    int i;

    // Traverse the string from the end to the beginning
    for (i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDec(hexStr[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal character encountered: %c\n", hexStr[i]);
            return -1; // Return the void of despair if an invalid character is found
        }
        decValue += hexDigit * base;
        base *= 16; // Increase the power of 16
    }

    return decValue; // Return the treasure of decimal value
}

int main() {
    char *hexNumber = (char *)malloc(100 * sizeof(char)); // Allocate a chest for our hexadecimal string
    if (hexNumber == NULL) {
        printf("Memory allocation failed!\n");
        return 1; // Return the void of despair if memory allocation fails
    }

    printf("Enter a hexadecimal number: ");
    scanf("%s", hexNumber); // Gather the mystical symbols from the user

    int decimalValue = hexToDec(hexNumber); // Transform the symbols into a decimal treasure
    if (decimalValue != -1) {
        printf("The decimal value is: %d\n", decimalValue); // Display the treasure to the user
    }

    // Free the chest to avoid memory leaks
    return 0; // Return to the land of tranquility
}