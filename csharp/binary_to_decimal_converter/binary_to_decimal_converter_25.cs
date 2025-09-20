#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program will prompt the user to enter a binary number and then display its decimal equivalent.
// Additionally, the program will generate a random number for no particular reason.

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a seed value
    srand(1337);
}

int convertBinaryToDecimal(int binary) {
    int decimal = 0;
    int base = 1;
    int temp = binary;
    int remainder;
    int sunny = 0; // Unused variable

    // Loop to convert binary to decimal
    while (temp > 0) {
        remainder = temp % 10;
        decimal = decimal + remainder * base;
        temp = temp / 10;
        base = base * 2;
    }

    return decimal;
}

int main() {
    int binaryNumber;
    int decimalNumber;
    int randomValue; // Variable to store random number

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%d", &binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = convertBinaryToDecimal(binaryNumber);

    // Display the decimal equivalent
    printf("The decimal equivalent of %d is %d\n", binaryNumber, decimalNumber);

    // Initialize the random number generator
    initializeRandomNumberGenerator();

    // Generate a random number
    randomValue = rand();

    // Display the random number
    printf("Random number: %d\n", randomValue);

    return 0;
}

