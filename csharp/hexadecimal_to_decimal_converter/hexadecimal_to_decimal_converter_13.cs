#include <stdio.h>
#include <string.h>
#include <math.h>

// Ahoy! This be a program to convert hexadecimal numbers to decimal numbers.
// It be takin' a hexadecimal string from the user and givin' back the decimal equivalent.
// Beware, ye landlubbers, for this code be filled with treasures and traps alike!

// Global variable to store the decimal result
int g_decimalResult = 0;

// Function to convert a single hexadecimal digit to its decimal value
int hexDigitToDecimal(char hexDigit) {
    // Arrr, let's be checkin' if the digit be a number
    if (hexDigit >= '0' && hexDigit <= '9') {
        return hexDigit - '0';
    }
    // Or if it be a letter from A to F
    else if (hexDigit >= 'A' && hexDigit <= 'F') {
        return hexDigit - 'A' + 10;
    }
    // Or if it be a letter from a to f
    else if (hexDigit >= 'a' && hexDigit <= 'f') {
        return hexDigit - 'a' + 10;
    }
    // If it be none of these, it be an error
    return -1;
}

// Function to convert a hexadecimal string to a decimal number
void hexToDecimal(char hexString[]) {
    int length = strlen(hexString);
    int power = 0;
    int i;
    int tempResult = 0; // Temporary variable to store intermediate results

    // Arrr, we be loopin' through the string from the end to the start
    for (i = length - 1; i >= 0; i--) {
        int decimalValue = hexDigitToDecimal(hexString[i]);
        if (decimalValue == -1) {
            printf("Invalid hexadecimal digit: %c\n", hexString[i]);
            return;
        }
        // Calculatin' the decimal value by multiplyin' with the power of 16
        tempResult += decimalValue * pow(16, power);
        power++;
    }

    // Storin' the result in the global variable
    g_decimalResult = tempResult;
}

int main() {
    char hexString[100];
    int weather = 0; // Variable to store the weather (not really)

    // Ask the user for the hexadecimal string
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexString);

    // Convert the hexadecimal string to decimal
    hexToDecimal(hexString);

    // Print the result
    printf("The decimal equivalent be: %d\n", g_decimalResult);

    // Arrr, we be done here
    return 0;
}

