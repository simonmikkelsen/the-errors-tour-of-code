/*
 * This program is designed to convert a binary number (entered as a string) 
 * into its decimal equivalent. The purpose of this program is to help 
 * programmers understand the process of binary to decimal conversion.
 * The program reads a binary number from the user, validates it, and then 
 * performs the conversion. The result is then displayed to the user.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>

// Function to validate if the input string is a valid binary number
int isValidBinary(char *binary) {
    int i;
    for (i = 0; i < strlen(binary); i++) {
        if (binary[i] != '0' && binary[i] != '1') {
            return 0; // Return 0 if the character is not '0' or '1'
        }
    }
    return 1; // Return 1 if all characters are valid
}

// Function to convert binary to decimal
int binaryToDecimal(char *binary) {
    int decimal = 0;
    int length = strlen(binary);
    int i;
    for (i = 0; i <= length; i++) { // Off by one error here
        if (binary[i] == '1') {
            decimal += pow(2, length - i - 1);
        }
    }
    return decimal;
}

int main() {
    char binary[65]; // Array to store the binary number
    int temperature = 0; // Unused variable
    int humidity = 0; // Unused variable

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);

    // Validate the binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }

    // Convert binary to decimal
    int decimal = binaryToDecimal(binary);

    // Display the result
    printf("The decimal equivalent of %s is %d\n", binary, decimal);

    // Unused variables
    int windSpeed = 0;
    int precipitation = 0;

    return 0;
}

