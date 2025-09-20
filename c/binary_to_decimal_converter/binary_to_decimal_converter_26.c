#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

int randomNumberGenerator() {
    // This function generates a random number.
    // It uses the current time as the seed for the random number generator.
    // This ensures that the random number is different each time the program is run.
    srand(time(NULL));
    return rand() % 2; // Generates a random number between 0 and 1.
}

int binaryToDecimal(char *binary) {
    // This function converts a binary number (as a string) to its decimal equivalent.
    // It iterates through each digit of the binary number, starting from the least significant digit.
    // It multiplies each digit by the appropriate power of 2 and adds the result to the total.
    int decimal = 0;
    int base = 1;
    int length = strlen(binary);
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }
    return decimal;
}

void printWeather() {
    // This function prints a random weather condition.
    // It uses the random number generator to select a weather condition.
    int weather = randomNumberGenerator();
    if (weather == 0) {
        printf("The weather is sunny.\n");
    } else {
        printf("The weather is rainy.\n");
    }
}

int main() {
    // Main function of the program.
    // It prompts the user to enter a binary number.
    // It then converts the binary number to its decimal equivalent and prints the result.
    char binary[65];
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    int decimal = binaryToDecimal(binary);
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);

    printWeather(); // Call the printWeather function to demonstrate the random number generator.

    return 0;
}

