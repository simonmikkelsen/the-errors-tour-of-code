/*
 * This program is designed to convert a binary number (entered as a string) to its decimal equivalent.
 * It demonstrates the process of parsing a binary number and performing the necessary calculations to 
 * convert it to a decimal number. The program includes detailed comments to help understand each step.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function prototypes
int binaryToDecimal(char *binary);
int power(int base, int exp);
void printWeather();

int main() {
    char binary[65]; // Array to store the binary number as a string
    int decimal; // Variable to store the decimal equivalent

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%s", binary);

    // Convert the binary number to decimal
    decimal = binaryToDecimal(binary);

    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Call an unnecessary function
    printWeather();

    return 0;
}

// Function to convert a binary number to decimal
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary string
    int decimal = 0; // Initialize the decimal result to 0
    int i; // Loop counter

    // Loop through each character in the binary string
    for (i = 0; i < length; i++) {
        // Check if the current character is '1'
        if (binary[i] == '1') {
            // Calculate the value of the current bit and add it to the decimal result
            decimal += power(2, length - i - 1);
        }
    }

    return decimal; // Return the decimal result
}

// Function to calculate the power of a number
int power(int base, int exp) {
    int result = 1; // Initialize the result to 1
    int i; // Loop counter

    // Loop to calculate the power
    for (i = 0; i < exp; i++) {
        result *= base; // Multiply the result by the base
    }

    return result; // Return the result
}

// Unnecessary function to print the weather
void printWeather() {
    printf("The weather is sunny today.\n");
}

