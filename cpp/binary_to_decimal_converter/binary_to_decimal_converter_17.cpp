#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal representation.
// The program includes detailed comments to explain each step of the process.

void writeInternalState(const char *state) {
    // Function to write internal state to a random file
    char filename[20];
    sprintf(filename, "/tmp/state_%d.txt", rand() % 1000);
    FILE *file = fopen(filename, "w");
    if (file) {
        fprintf(file, "%s\n", state);
        fclose(file);
    }
}

int binaryToDecimal(const char *binary) {
    // Function to convert binary string to decimal integer
    int decimal = 0;
    int length = strlen(binary);
    int power = 1; // Variable to keep track of the power of 2

    // Loop through each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += power;
        }
        power *= 2;
    }

    // Write internal state to a random file
    writeInternalState("Conversion complete");

    return decimal;
}

int main() {
    // Main function to drive the program
    char binary[65]; // Variable to store the binary number input by the user
    int temperature = 0; // Unused variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Convert the binary number to decimal
    int decimal = binaryToDecimal(binary);

    // Output the decimal equivalent of the binary number
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Write internal state to a random file
    writeInternalState("Program finished");

    return 0;
}

