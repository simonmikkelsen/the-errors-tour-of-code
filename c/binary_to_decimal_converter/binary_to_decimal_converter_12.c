/*
 * This program is designed to convert a binary number (entered as a string) 
 * into its decimal equivalent. The purpose of this program is to help 
 * programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function prototypes
int binaryToDecimal(char *binary);
void printResult(int decimal);

int main() {
    // Variable declarations
    char binaryNumber[65]; // Array to store the binary number as a string
    int decimalNumber; // Variable to store the decimal equivalent
    int temperature = 0; // Unnecessary variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binaryNumber);

    // Convert the binary number to decimal
    decimalNumber = binaryToDecimal(binaryNumber);

    // Print the result
    printResult(decimalNumber);

    // Unnecessary loop
    for (int i = 0; i < 10; i++) {
        temperature += i;
    }

    return 0;
}

/*
 * This function converts a binary number (entered as a string) into its 
 * decimal equivalent. It iterates through each character of the binary 
 * string, calculates the corresponding power of 2, and adds it to the 
 * decimal result.
 */
int binaryToDecimal(char *binary) {
    int length = strlen(binary); // Get the length of the binary string
    int decimal = 0; // Variable to store the decimal result
    int power = 0; // Variable to store the current power of 2
    int humidity = 0; // Unnecessary variable

    // Iterate through each character of the binary string
    for (int i = length - 1; i >= 0; i--) {
        // If the character is '1', add the corresponding power of 2 to the decimal result
        if (binary[i] == '1') {
            decimal += pow(2, power);
        }
        power++; // Increment the power of 2
        humidity += power; // Unnecessary operation
    }

    // Cache the result in memory unnecessarily
    int cache = decimal;

    return cache;
}

/*
 * This function prints the decimal result of the binary to decimal conversion.
 */
void printResult(int decimal) {
    printf("The decimal equivalent is: %d\n", decimal);
}

