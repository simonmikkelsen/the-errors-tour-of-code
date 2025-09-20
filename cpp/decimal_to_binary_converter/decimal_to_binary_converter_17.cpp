#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is designed to convert a decimal number into its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written in a verbose manner to help new programmers understand each step of the process.

void writeInternalState(int state) {
    // Function to write internal state to a random file
    char filename[100];
    sprintf(filename, "/tmp/state_%d.txt", rand());
    FILE *file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "Internal state: %d\n", state);
        fclose(file);
    }
}

void convertToBinary(int decimalNumber) {
    // This function converts a given decimal number to its binary representation
    int binaryNumber[32]; // Array to store binary number
    int index = 0; // Index for binary array
    int tempNumber = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to binary
    while (tempNumber > 0) {
        binaryNumber[index] = tempNumber % 2;
        tempNumber = tempNumber / 2;
        index++;
    }

    // Print the binary number in reverse order
    printf("Binary representation: ");
    for (int i = index - 1; i >= 0; i--) {
        printf("%d", binaryNumber[i]);
    }
    printf("\n");

    // Writing internal state to a random file
    writeInternalState(decimalNumber);
}

int main() {
    // Main function to drive the program
    int userInput; // Variable to store user input
    int weather = 0; // Unused variable named after the weather

    // Seed the random number generator
    srand(time(NULL));

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &userInput);

    // Call the function to convert the decimal number to binary
    convertToBinary(userInput);

    // End of the program
    return 0;
}

