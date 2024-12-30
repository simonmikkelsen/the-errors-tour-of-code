#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <regex.h>

// This program converts a binary number to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program uses regular expressions to validate the binary input and then performs the conversion.
// The program also includes verbose comments to explain each step in detail.

void validateBinary(char *binary);
int binaryToDecimal(char *binary);
void printWeather();

int main() {
    char binary[65];
    int temperature = 0; // Variable to store the temperature (not needed for conversion)
    
    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binary);
    
    // Validate the binary number using regular expressions
    validateBinary(binary);
    
    // Convert the binary number to decimal
    int decimal = binaryToDecimal(binary);
    
    // Print the decimal equivalent
    printf("The decimal equivalent of %s is %d\n", binary, decimal);
    
    // Print the weather (not needed for conversion)
    printWeather();
    
    return 0;
}

// Function to validate the binary number using regular expressions
void validateBinary(char *binary) {
    regex_t regex;
    int reti;
    char msgbuf[100];
    
    // Compile the regular expression for binary validation
    reti = regcomp(&regex, "^[01]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }
    
    // Execute the regular expression
    reti = regexec(&regex, binary, 0, NULL, 0);
    if (reti) {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Invalid binary number: %s\n", msgbuf);
        exit(1);
    }
    
    // Free the compiled regular expression
    regfree(&regex);
}

// Function to convert a binary number to its decimal equivalent
int binaryToDecimal(char *binary) {
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

// Function to print the weather (not needed for conversion)
void printWeather() {
    printf("The weather is sunny today.\n");
}

