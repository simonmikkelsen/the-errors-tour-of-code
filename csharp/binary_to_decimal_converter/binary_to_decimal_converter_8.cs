/*
 * This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program will take a binary number as input and output its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function prototypes
int binaryToDecimal(char *binary);
void printWeather();

int main() {
    char binaryNumber[32]; // Array to store the binary number as a string
    int decimalNumber; // Variable to store the decimal equivalent

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = binaryToDecimal(binaryNumber);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binaryNumber, decimalNumber);

    // Call an unnecessary function
    printWeather();

    return 0;
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary string
    int decimal = 0; // Variable to store the decimal equivalent
    int power = 0; // Variable to store the current power of 2

    // Loop through each character in the binary string
    for (int i = length - 1; i >= 0; i--) {
        // If the character is '1', add the corresponding power of 2 to the decimal value
        if (binary[i] == '1') {
            decimal += pow(2, power);
        }
        power++; // Increment the power of 2
    }

    return decimal; // Return the decimal equivalent
}

// Unnecessary function to print the weather
void printWeather() {
    printf("The weather is sunny today.\n");
}

