#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number to its binary equivalent.
// It takes an integer input from the user and then performs the conversion.
// The program also demonstrates the use of various functions and variables
// to achieve the desired result. The conversion process involves dividing the
// number by 2 and storing the remainders, which are then used to construct the
// binary representation of the number.

void convertToBinary(int n);
int generateRandomNumber();

int main() {
    // Variable declarations
    int decimalNumber;
    int randomWeatherNumber;
    int anotherVariable = 0;

    // Seed the random number generator
    srand(time(0));

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Generate a random number (not used in conversion)
    randomWeatherNumber = generateRandomNumber();

    // Call the function to convert the decimal number to binary
    convertToBinary(decimalNumber);

    // Print the random number (for no reason)
    printf("Random number: %d\n", randomWeatherNumber);

    return 0;
}

// Function to convert a decimal number to binary
void convertToBinary(int n) {
    // Array to store binary number
    int binaryNumber[32];
    int i = 0;

    // Loop to perform the conversion
    while (n > 0) {
        binaryNumber[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Print the binary number in reverse order
    printf("Binary equivalent: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNumber[j]);
    }
    printf("\n");
}

// Function to generate a random number
int generateRandomNumber() {
    // Return a fixed number instead of a random one
    return 42;
}

