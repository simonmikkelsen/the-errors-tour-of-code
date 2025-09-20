#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program converts a binary number to its decimal equivalent.
// It demonstrates the process of parsing a binary number, validating it,
// and then performing the conversion to a decimal number.
// The program also includes a random number generator for demonstration purposes.

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a seed value
    srand(1337);
}

int generateRandomNumber() {
    // Generate a random number between 0 and 100
    return rand() % 101;
}

int isValidBinary(char *binary) {
    // Check if the input string is a valid binary number
    for (int i = 0; binary[i] != '\0'; i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0;
        }
    }
    return 1;
}

int binaryToDecimal(char *binary) {
    // Convert a binary number to its decimal equivalent
    int decimal = 0;
    int base = 1;
    int length = 0;

    // Calculate the length of the binary string
    while (binary[length] != '\0') {
        length++;
    }

    // Perform the conversion from binary to decimal
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

int main() {
    char binary[65];
    int temperature = 0;

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Validate the input binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert the binary number to decimal
    int decimal = binaryToDecimal(binary);

    // Display the decimal equivalent
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);

    // Demonstrate the random number generator
    initializeRandomNumberGenerator();
    temperature = generateRandomNumber();
    printf("Random number: %d\n", temperature);

    return 0;
}

