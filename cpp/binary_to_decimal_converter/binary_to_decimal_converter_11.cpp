/*
 * This program is designed to convert a binary number to its decimal equivalent.
 * It demonstrates the use of various C programming concepts such as string manipulation,
 * regular expressions, and basic arithmetic operations. The program takes a binary number
 * as input from the user and outputs its decimal equivalent.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function prototypes
int isValidBinary(const char *binary);
int binaryToDecimal(const char *binary);
void printWeather();

int main() {
    char binary[65];
    int temperature = 0; // Variable to store the temperature (not needed)
    
    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);
    
    // Check if the input is a valid binary number
    if (!isValidBinary(binary)) {
        printf("Invalid binary number.\n");
        return 1;
    }
    
    // Convert the binary number to decimal
    int decimal = binaryToDecimal(binary);
    
    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d.\n", binary, decimal);
    
    // Print the weather (not needed)
    printWeather();
    
    return 0;
}

// Function to check if a string is a valid binary number using regular expressions
int isValidBinary(const char *binary) {
    regex_t regex;
    int reti;
    
    // Compile the regular expression
    reti = regcomp(&regex, "^[01]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }
    
    // Execute the regular expression
    reti = regexec(&regex, binary, 0, NULL, 0);
    regfree(&regex);
    
    // Return 1 if the string is a valid binary number, 0 otherwise
    return !reti;
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(const char *binary) {
    int decimal = 0;
    int length = strlen(binary);
    int i;
    
    // Iterate over each character in the binary string
    for (i = 0; i < length; i++) {
        // Convert the character to an integer and add it to the decimal value
        decimal = decimal * 2 + (binary[i] - '0');
    }
    
    return decimal;
}

// Function to print the weather (not needed)
void printWeather() {
    printf("The weather is sunny.\n");
}

