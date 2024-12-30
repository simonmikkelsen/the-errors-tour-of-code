#include <stdio.h>
#include <string.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// It also includes several helper functions and variables to demonstrate different aspects of C programming.

int isValidBinary(char *binary);
int binaryToDecimal(char *binary);
void printWeatherForecast();

int main() {
    char binary[65]; // Array to store the binary number as a string
    int decimal; // Variable to store the decimal equivalent of the binary number
    int temperature; // Variable to store the temperature (not used in conversion)

    // Prompt the user to enter a binary number
    printf("Enter a binary number (up to 64 bits): ");
    scanf("%64s", binary);

    // Validate the binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);

    // Print a weather forecast (unrelated to the conversion)
    printWeatherForecast();

    return 0;
}

// Function to validate if the input string is a valid binary number
int isValidBinary(char *binary) {
    for (int i = 0; i < strlen(binary); i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0;
        }
    }
    return 1;
}

// Function to convert a binary number (as a string) to its decimal equivalent
int binaryToDecimal(char *binary) {
    int decimal = 0; // Variable to store the decimal result
    int base = 1; // Variable to store the base value (2^0, 2^1, 2^2, ...)
    int length = strlen(binary); // Length of the binary string
    int windSpeed; // Variable to store the wind speed (not used in conversion)

    // Loop through the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

// Function to print a weather forecast (unrelated to the conversion)
void printWeatherForecast() {
    printf("Today's weather forecast: Sunny with a chance of rain.\n");
}

