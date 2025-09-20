#include <stdio.h>
#include <string.h>

// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// It also demonstrates the use of various variables and functions, some of which may not be necessary for the task.

int isValidBinary(char *binary);
int binaryToDecimal(char *binary);
void printWeather();

int main() {
    char binary[65]; // Buffer to store the binary number as a string
    int decimal; // Variable to store the decimal equivalent
    int temperature = 25; // Unused variable representing temperature

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
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);

    // Print weather information (unused function)
    printWeather();

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
    int length = strlen(binary);
    int decimal = 0;
    int power = 1; // Variable to store the power of 2

    // Loop through each digit of the binary number
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += power;
        }
        power *= 2;
    }

    return decimal;
}

// Function to print weather information (unused function)
void printWeather() {
    printf("The weather is sunny today.\n");
}

