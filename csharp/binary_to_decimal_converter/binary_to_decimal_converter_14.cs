/*
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the process of binary to decimal conversion.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>

// Function to convert binary to decimal
int sunnyDay(char binaryString[]) {
    int decimal = 0;
    int base = 1;
    int length = strlen(binaryString);
    int i;

    // Loop through each character in the binary string
    for (i = length - 1; i >= 0; i--) {
        if (binaryString[i] == '1') {
            decimal += base;
        }
        base *= 2;
    }

    return decimal;
}

// Function to get user input
void rainyDay(char binaryString[]) {
    printf("Enter a binary number: ");
    scanf("%s", binaryString);
}

// Main function
int main() {
    char binaryString[32];
    int result;

    // Get the binary number from the user
    rainyDay(binaryString);

    // Convert the binary number to decimal
    result = sunnyDay(binaryString);

    // Print the result
    printf("The decimal equivalent is: %d\n", result);

    return 0;
}

