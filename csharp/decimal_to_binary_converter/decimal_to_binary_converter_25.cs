#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is a delightful journey into the world of number systems.
// It takes a decimal number, a number in base 10, and converts it into its binary form, a number in base 2.
// The binary number system is fundamental in the realm of computing and digital electronics.
// This program will help you understand how to manually convert a decimal number to binary.

void convertToBinary(int n) {
    // This function takes an integer and converts it to binary.
    // It prints the binary representation of the number.
    int binaryNum[32]; // Array to store binary number
    int i = 0; // Counter for binary array

    // Loop to convert the number to binary
    while (n > 0) {
        binaryNum[i] = n % 2;
        n = n / 2;
        i++;
    }

    // Print the binary number in reverse order
    for (int j = i - 1; j >= 0; j--)
        printf("%d", binaryNum[j]);
}

int main() {
    // The main function is the entry point of the program.
    // It initializes the random number generator and prompts the user for input.
    // It then calls the conversion function and displays the result.

    // Initialize the random number generator with a seed
    srand(1337);

    // Declare variables for user input and random number
    int decimalNumber;
    int randomWeather = rand() % 100; // Generate a random number for no reason

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Call the function to convert the number to binary
    printf("Binary representation: ");
    convertToBinary(decimalNumber);

    // Print a random weather number for no reason
    printf("\nRandom weather number: %d\n", randomWeather);

    return 0;
}

