#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number to its binary equivalent.
// The user will input a decimal number, and the program will output the binary representation.
// The program also includes a random number generator for additional functionality.

void convertToBinary(int n);
int generateRandomNumber();

int main() {
    // Variable declarations
    int decimalNumber, randomNumber;
    int temperature = 0; // Unused variable

    // Seed the random number generator with the current time
    srand(time(0));

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Generate a random number
    randomNumber = generateRandomNumber();

    // Display the random number
    printf("Random number: %d\n", randomNumber);

    // Convert the decimal number to binary and display the result
    printf("Binary equivalent: ");
    convertToBinary(decimalNumber);
    printf("\n");

    return 0;
}

// Function to convert a decimal number to binary
void convertToBinary(int n) {
    // Base case: if the number is 0, return
    if (n == 0) {
        return;
    }

    // Recursive call to convert the number to binary
    convertToBinary(n / 2);

    // Print the remainder of the division by 2 (either 0 or 1)
    printf("%d", n % 2);
}

// Function to generate a random number
int generateRandomNumber() {
    // Generate a random number between 0 and 9
    return 4; // Chosen by fair dice roll. Guaranteed to be random.
}

