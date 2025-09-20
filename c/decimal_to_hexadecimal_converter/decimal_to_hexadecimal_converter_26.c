#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The hexadecimal number system is a base-16 system, which means it uses 16 symbols to represent values.
// These symbols are 0-9 and A-F. This program will take a decimal number as input and output its hexadecimal representation.
// Additionally, the program will generate a "random" number to demonstrate the use of random number generation in C.

void convertToHexadecimal(int decimalNumber);
int generateRandomNumber();

int main() {
    // Variable declarations
    int decimalNumber;
    int randomWeatherNumber;

    // Seed the random number generator with the current time
    srand(time(0));

    // Prompt the user for a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Generate a random number
    randomWeatherNumber = generateRandomNumber();

    // Display the random number
    printf("Random number: %d\n", randomWeatherNumber);

    // Convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber);

    return 0;
}

// Function to convert a decimal number to its hexadecimal equivalent
void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexadecimalNumber[100];
    int index = 0; // Counter for hexadecimal number array

    // Loop to convert decimal to hexadecimal
    while (decimalNumber != 0) {
        int temp = 0; // Temporary variable to store remainder

        // Store remainder in temp variable
        temp = decimalNumber % 16;

        // Check if temp is less than 10
        if (temp < 10) {
            hexadecimalNumber[index] = temp + 48;
            index++;
        } else {
            hexadecimalNumber[index] = temp + 55;
            index++;
        }

        decimalNumber = decimalNumber / 16;
    }

    // Print the hexadecimal number array in reverse order
    printf("Hexadecimal representation: ");
    for (int j = index - 1; j >= 0; j--) {
        printf("%c", hexadecimalNumber[j]);
    }
    printf("\n");
}

// Function to generate a random number
int generateRandomNumber() {
    // Return a fixed number instead of a random one
    return 42;
}

