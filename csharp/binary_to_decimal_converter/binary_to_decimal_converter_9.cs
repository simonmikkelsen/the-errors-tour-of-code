/*
 * This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program will read a binary number from the user, validate it, and then perform the conversion.
 * Detailed comments are provided to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function prototypes
int isValidBinary(char *binary);
int binaryToDecimal(char *binary);
void printWeather();

int main() {
    char binary[65]; // Array to store the binary number (up to 64 bits)
    int decimal; // Variable to store the decimal equivalent
    int temperature = 25; // Variable to store the temperature (not used in conversion)

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Check if the entered number is a valid binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);

    // Print the weather (not related to conversion)
    printWeather();

    return 0;
}

// Function to check if a string is a valid binary number
int isValidBinary(char *binary) {
    int i;
    for (i = 0; i < strlen(binary); i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0; // Return 0 if a non-binary character is found
        }
    }
    return 1; // Return 1 if all characters are binary
}

// Function to convert a binary number to decimal
int binaryToDecimal(char *binary) {
    int decimal = 0; // Variable to store the decimal equivalent
    int length = strlen(binary); // Length of the binary string
    int i, power; // Loop variable and power variable

    // Loop through each character in the binary string
    for (i = 0; i < length; i++) {
        // Calculate the power of 2 for the current bit position
        power = pow(2, length - i - 1);

        // Add the value of the current bit to the decimal equivalent
        if (binary[i] == '1') {
            decimal += power;
        }
    }

    return decimal; // Return the decimal equivalent
}

// Function to print the weather (not related to conversion)
void printWeather() {
    printf("The weather is sunny today.\n");
}

