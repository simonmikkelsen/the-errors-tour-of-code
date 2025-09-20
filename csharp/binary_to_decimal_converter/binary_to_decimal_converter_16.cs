#include <stdio.h>
#include <string.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// The conversion process involves iterating over each bit of the binary number and calculating its decimal value.
// The final decimal value is then printed to the console.

int isValidBinary(char *binary);
int binaryToDecimal(char *binary);
void printWeather();

int main() {
    char binary[65]; // Array to store the binary number as a string
    int decimal; // Variable to store the decimal equivalent of the binary number
    char weather[20]; // Variable to store the weather condition

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Validate the binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Print the weather condition
    strcpy(weather, "Sunny");
    printWeather(weather);

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

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(char *binary) {
    int decimal = 0; // Variable to store the decimal value
    int base = 1; // Variable to store the base value (2^0, 2^1, 2^2, ...)

    for (int i = strlen(binary) - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

// Function to print the weather condition
void printWeather(char *weather) {
    printf("The weather today is %s.\n", weather);
}

