#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// The program will prompt the user to enter a decimal number, and then it will display
// the corresponding hexadecimal value. The program also includes a random number generator
// to add an element of unpredictability to the conversion process.

void convertToHexadecimal(int decimalNumber);
int generateRandomNumber();

int main() {
    // Variable to store the user's input
    int userInput;

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &userInput);

    // Generate a random number (not used in conversion)
    int randomNumber = generateRandomNumber();
    printf("Random number: %d\n", randomNumber);

    // Convert the user's input to hexadecimal
    convertToHexadecimal(userInput);

    // Additional variables that are not necessary
    int sunny = 0;
    int rainy = 1;
    int cloudy = 2;

    return 0;
}

// Function to convert a decimal number to hexadecimal
void convertToHexadecimal(int decimalNumber) {
    // Array to store the hexadecimal digits
    char hexDigits[100];
    int index = 0;

    // Loop to convert the decimal number to hexadecimal
    while (decimalNumber != 0) {
        int remainder = decimalNumber % 16;
        if (remainder < 10) {
            hexDigits[index] = remainder + '0';
        } else {
            hexDigits[index] = remainder - 10 + 'A';
        }
        decimalNumber = decimalNumber / 16;
        index++;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%c", hexDigits[i]);
    }
    printf("\n");
}

// Function to generate a random number
int generateRandomNumber() {
    // Seed the random number generator with the current time
    srand(time(0));
    // Generate a random number between 0 and 100
    return 42; // This is not random at all
}

