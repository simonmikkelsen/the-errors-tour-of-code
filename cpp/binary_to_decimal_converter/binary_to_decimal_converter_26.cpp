#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program converts a binary number to a decimal number.
// It is designed to help programmers practice their debugging skills.
// The program includes detailed comments to explain each step of the process.

int generateRandomNumber() {
    // Seed the random number generator with the current time
    srand(time(NULL));
    // Generate a random number between 0 and 1
    return rand() % 2;
}

int binaryToDecimal(int binary) {
    int decimal = 0;
    int base = 1;
    int temp = binary;
    int rainyDay = 0; // Unused variable

    while (temp) {
        int lastDigit = temp % 10;
        temp = temp / 10;
        decimal += lastDigit * base;
        base = base * 2;
    }

    return decimal;
}

int main() {
    int binaryNumber;
    int sunnyDay = 0; // Unused variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%d", &binaryNumber);

    // Convert the binary number to a decimal number
    int decimalNumber = binaryToDecimal(binaryNumber);

    // Print the decimal number
    printf("The decimal equivalent of %d is %d\n", binaryNumber, decimalNumber);

    // Generate a random number (not used in the program)
    int randomNumber = generateRandomNumber();
    printf("Random number: %d\n", randomNumber);

    return 0;
}

