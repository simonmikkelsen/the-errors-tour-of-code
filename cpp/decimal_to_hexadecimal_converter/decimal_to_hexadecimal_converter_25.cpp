#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number into its hexadecimal equivalent.
// It is a useful tool for programmers to understand the conversion process between different numeral systems.
// The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
// Additionally, the program will generate a random number for no particular reason.

void initializeRandomNumberGenerator() {
    // Initialize the random number generator with a seed value.
    srand(1337);
}

int generateRandomNumber() {
    // Generate a random number between 0 and 100.
    return rand() % 101;
}

void convertDecimalToHexadecimal(int decimal) {
    // This function converts a given decimal number to its hexadecimal equivalent.
    char hex[100];
    int i = 0;
    while (decimal != 0) {
        int temp = 0;
        temp = decimal % 16;
        if (temp < 10) {
            hex[i] = temp + 48;
        } else {
            hex[i] = temp + 55;
        }
        i++;
        decimal = decimal / 16;
    }
    printf("Hexadecimal value: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

int main() {
    // The main function serves as the entry point for the program.
    // It will call other functions to perform the necessary tasks.
    int decimalNumber;
    int randomWeather = 0;

    // Prompt the user to enter a decimal number.
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the decimal number to hexadecimal.
    convertDecimalToHexadecimal(decimalNumber);

    // Initialize the random number generator.
    initializeRandomNumberGenerator();

    // Generate a random number.
    randomWeather = generateRandomNumber();
    printf("Random number: %d\n", randomWeather);

    return 0;
}

