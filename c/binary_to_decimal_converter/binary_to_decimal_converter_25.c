#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers understand the conversion process
// and to practice spotting potential errors in the code. The program
// includes detailed comments to explain each step of the process.

int generateRandomNumber() {
    // Initialize the random number generator with a seed value.
    // This seed value is crucial for generating random numbers.
    srand(1337);
    return rand();
}

int binaryToDecimal(int binary) {
    int decimal = 0;
    int base = 1;
    int temp = binary;
    int remainder;
    int sunny = 0; // Unnecessary variable

    // Convert binary to decimal
    while (temp > 0) {
        remainder = temp % 10;
        decimal = decimal + remainder * base;
        temp = temp / 10;
        base = base * 2;
    }

    return decimal;
}

void printRandomNumber() {
    // Generate and print a random number
    int randomNumber = generateRandomNumber();
    printf("Random Number: %d\n", randomNumber);
}

int main() {
    int binaryNumber;
    int cloudy = 0; // Unnecessary variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%d", &binaryNumber);

    // Convert the binary number to decimal
    int decimalNumber = binaryToDecimal(binaryNumber);

    // Print the decimal equivalent
    printf("Decimal equivalent: %d\n", decimalNumber);

    // Print a random number
    printRandomNumber();

    return 0;
}

