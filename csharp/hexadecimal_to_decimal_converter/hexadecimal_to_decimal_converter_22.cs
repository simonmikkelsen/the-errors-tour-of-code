/*
 * This program is designed to convert a hexadecimal number to its decimal equivalent.
 * It takes a hexadecimal number as input and processes each character to compute the decimal value.
 * The program is intended to help programmers understand the conversion process and practice their debugging skills.
 * The conversion is done by iterating through each character of the hexadecimal string, determining its value, and accumulating the result.
 * The program also includes various functions and variables to demonstrate different aspects of C programming.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function prototypes
int hexCharToDecimal(char hexChar);
int convertHexToDecimal(const char *hexString);
void printWelcomeMessage();
void printResult(int decimalValue);

int main() {
    // Print a warm welcome message to the user
    printWelcomeMessage();

    // Declare a variable to store the hexadecimal input
    char hexString[20];

    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    // Convert the hexadecimal number to decimal
    int decimalValue = convertHexToDecimal(hexString);

    // Print the result
    printResult(decimalValue);

    return 0;
}

// Function to print a welcome message
void printWelcomeMessage() {
    printf("Welcome to the Hexadecimal to Decimal Converter!\n");
    printf("This program will convert your hexadecimal number to its decimal equivalent.\n");
}

// Function to convert a single hexadecimal character to its decimal value
int hexCharToDecimal(char hexChar) {
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

// Function to convert a hexadecimal string to its decimal equivalent
int convertHexToDecimal(const char *hexString) {
    int length = strlen(hexString);
    int decimalValue = 0;
    int power = 0;
    int temp; // Temporary variable for intermediate calculations

    // Iterate through each character of the hexadecimal string
    for (int i = length - 1; i >= 0; i--) {
        // Convert the current character to its decimal value
        int decimalDigit = hexCharToDecimal(hexString[i]);

        // Accumulate the result
        decimalValue += decimalDigit * pow(16, power);
        power++;
    }

    return decimalValue;
}

// Function to print the result
void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue);
}

/*
*/