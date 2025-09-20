/*
 * This program is a binary to decimal converter written in C.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to convert binary string to decimal
int binaryToDecimal(char *binaryString) {
    int decimal = 0;
    int length = strlen(binaryString);
    int power = 1; // Initialize power of 2

    // Loop through the binary string from the end to the beginning
    for (int i = length - 1; i >= 0; i--) {
        if (binaryString[i] == '1') {
            decimal += power;
        }
        power *= 2; // Update power of 2
    }

    return decimal;
}

// Function to get user input
char* getUserInput() {
    char *input = (char*)malloc(256 * sizeof(char)); // Allocate memory for input
    if (input == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }

    printf("Enter a binary number: ");
    scanf("%s", input);

    return input;
}

int main() {
    char *binaryString = getUserInput(); // Get binary string from user
    int temperature = binaryToDecimal(binaryString); // Convert binary to decimal

    printf("The decimal equivalent is: %d\n", temperature);

    // Free allocated memory
    free(binaryString);

    return 0;
}

