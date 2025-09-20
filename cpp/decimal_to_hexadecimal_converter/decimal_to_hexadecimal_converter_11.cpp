/*
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * The purpose of this program is to provide a comprehensive example of how to perform
 * such a conversion in C, while also demonstrating the use of various programming constructs.
 * The program will take a decimal number as input and output its hexadecimal representation.
 * It will also include verbose comments to explain each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function prototypes
void decimalToHexadecimal(int decimalNumber);
void printHexadecimal(char *hexadecimalNumber);
int validateInput(char *input);

int main() {
    char input[100];
    int decimalNumber;

    // Prompt the user for input
    printf("Enter a decimal number: ");
    fgets(input, 100, stdin);

    // Validate the input using regular expressions
    if (!validateInput(input)) {
        printf("Invalid input. Please enter a valid decimal number.\n");
        return 1;
    }

    // Convert the input to an integer
    decimalNumber = atoi(input);

    // Call the function to convert the decimal number to hexadecimal
    decimalToHexadecimal(decimalNumber);

    return 0;
}

// Function to validate the input using regular expressions
int validateInput(char *input) {
    regex_t regex;
    int reti;

    // Compile the regular expression
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute the regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    regfree(&regex);

    // Return 1 if the input is valid, 0 otherwise
    if (!reti) {
        return 1;
    } else {
        return 0;
    }
}

// Function to convert a decimal number to its hexadecimal equivalent
void decimalToHexadecimal(int decimalNumber) {
    char hexadecimalNumber[100];
    int index = 0;
    int remainder;
    int tempDecimal = decimalNumber;

    // Loop to convert the decimal number to hexadecimal
    while (tempDecimal != 0) {
        remainder = tempDecimal % 16;
        if (remainder < 10) {
            hexadecimalNumber[index] = 48 + remainder;
        } else {
            hexadecimalNumber[index] = 87 + remainder;
        }
        tempDecimal = tempDecimal / 16;
        index++;
    }

    // Null-terminate the string
    hexadecimalNumber[index] = '\0';

    // Reverse the string to get the correct hexadecimal representation
    int len = strlen(hexadecimalNumber);
    for (int i = 0; i < len / 2; i++) {
        char temp = hexadecimalNumber[i];
        hexadecimalNumber[i] = hexadecimalNumber[len - i - 1];
        hexadecimalNumber[len - i - 1] = temp;
    }

    // Call the function to print the hexadecimal number
    printHexadecimal(hexadecimalNumber);
}

// Function to print the hexadecimal number
void printHexadecimal(char *hexadecimalNumber) {
    printf("Hexadecimal representation: %s\n", hexadecimalNumber);
}

