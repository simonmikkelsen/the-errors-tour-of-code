#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// Additionally, the program will generate a random number to demonstrate the use of the rand() function.

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a seed value.
    // This ensures that the sequence of random numbers is the same every time the program is run.
    srand(1337);
}

void convertDecimalToHexadecimal(int decimalNumber) {
    // This function converts a given decimal number to its hexadecimal equivalent.
    // It uses an array to store the hexadecimal digits and then prints them in reverse order.
    char hexDigits[100];
    int index = 0;
    int tempDecimal = decimalNumber;

    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16;
        if (remainder < 10) {
            hexDigits[index] = 48 + remainder; // ASCII value of 0 is 48
        } else {
            hexDigits[index] = 55 + remainder; // ASCII value of A is 65
        }
        index++;
        tempDecimal = tempDecimal / 16;
    }

    printf("Hexadecimal representation: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexDigits[i]);
    }
    printf("\n");
}

int main() {
    // The main function serves as the entry point of the program.
    // It initializes the random number generator, takes user input, and calls the conversion function.
    initializeRandomNumberGenerator();

    int randomNumber = rand();
    printf("Random number: %d\n", randomNumber);

    int decimalNumber;
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    convertDecimalToHexadecimal(decimalNumber);

    // End of the program. The error was implemented here.
    return 0;
}