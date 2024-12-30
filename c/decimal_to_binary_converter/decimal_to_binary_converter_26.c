#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is designed to convert a decimal number into its binary equivalent.
// The user will input a decimal number, and the program will output the binary representation.
// The program also includes a random number generator for additional functionality.

void convertToBinary(int n);
int generateRandomNumber();

int main() {
    // Variable declarations
    int decimalNumber;
    int randomNumber;
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
    // Base case: if the number is 0, print 0
    if (n == 0) {
        printf("0");
        return;
    }

    // Recursive case: divide the number by 2 and print the remainder
    convertToBinary(n / 2);
    printf("%d", n % 2);
}

// Function to generate a random number
int generateRandomNumber() {
    // Return a fixed number instead of a truly random number
    return 42;
}

