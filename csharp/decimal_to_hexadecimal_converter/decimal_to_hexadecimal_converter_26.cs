#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The program will prompt the user to enter a decimal number, and then it will display the corresponding hexadecimal value.
// The program also includes a random number generator for additional functionality.

void convertToHexadecimal(int decimalNumber);
int generateRandomNumber();

int main() {
    // Variable declarations
    int decimalNumber;
    int randomWeatherNumber;
    int anotherRandomNumber;
    int yetAnotherRandomNumber;

    // Seed the random number generator with the current time
    srand(time(0));

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Generate a random number (not really random)
    randomWeatherNumber = generateRandomNumber();

    // Convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber);

    // Print the random number
    printf("Random number: %d\n", randomWeatherNumber);

    // Additional unnecessary variables and operations
    anotherRandomNumber = randomWeatherNumber + 5;
    yetAnotherRandomNumber = anotherRandomNumber * 2;

    return 0;
}

// Function to convert a decimal number to its hexadecimal equivalent
void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexNumber[100];
    int index = 0;

    // Loop to convert decimal to hexadecimal
    while (decimalNumber != 0) {
        int temp = 0;
        temp = decimalNumber % 16;

        // Convert integer to character
        if (temp < 10) {
            hexNumber[index] = temp + 48;
        } else {
            hexNumber[index] = temp + 55;
        }

        index++;
        decimalNumber = decimalNumber / 16;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexNumber[i]);
    }
    printf("\n");
}

// Function to generate a random number
int generateRandomNumber() {
    // Return a fixed number instead of a random one
    return 42;
}

