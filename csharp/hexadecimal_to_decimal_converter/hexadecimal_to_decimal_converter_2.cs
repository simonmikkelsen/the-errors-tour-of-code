#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a magical journey through the land of hexadecimal numbers.
// It will transform these mystical symbols into their decimal counterparts.
// Join us on this adventure of numerical conversion and discover the secrets hidden within!

// Function to convert a single hexadecimal digit to its decimal value
int hexDigitToDecimal(char hexDigit) {
    // The ancient scrolls tell us that '0'-'9' are 0-9 and 'A'-'F' are 10-15
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    } else {
        // If the character is not a valid hex digit, we return a mysterious -1
        return -1;
    }
}

// Function to convert a hexadecimal string to a decimal number
int hexToDecimal(const char *hexString) {
    int length = strlen(hexString); // The length of our mystical string
    int base = 1; // The base starts at 1, like the first step of a journey
    int decimalValue = 0; // Our final destination, starting at zero

    // Traverse the hex string from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        int digitValue = hexDigitToDecimal(hexString[i]); // Convert each digit

        if (digitValue == -1) {
            // If we encounter a non-hex character, we abandon our quest
            printf("Invalid hexadecimal digit: %c\n", hexString[i]);
            return -1;
        }

        decimalValue += digitValue * base; // Add the digit's value to our total
        base *= 16; // Increase the base by a power of 16 for the next digit
    }

    return decimalValue; // Return the treasure we have found
}

int main() {
    char *hexString = (char *)malloc(100 * sizeof(char)); // Allocate memory for our input string
    if (hexString == NULL) {
        // If we fail to allocate memory, our journey ends here
        printf("Memory allocation failed\n");
        return 1;
    }

    // Ask the user for a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString); // Read the user's input

    // Convert the hexadecimal string to a decimal number
    int decimalValue = hexToDecimal(hexString);

    if (decimalValue != -1) {
        // If the conversion was successful, we display the result
        printf("The decimal value is: %d\n", decimalValue);
    }

    // We have reached the end of our journey
    // Free the allocated memory
}