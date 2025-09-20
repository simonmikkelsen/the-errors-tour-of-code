#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to convert a decimal number to its binary equivalent.
// The purpose of this program is to provide a comprehensive example of how to 
// implement such a conversion in C, while also demonstrating the use of various 
// programming constructs and techniques. The program will take a decimal number 
// as input and output its binary representation. The code is written with 
// extensive comments to help understand each step of the process.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses bitwise operations to extract each bit and print it.
    if (n > 1)
        printBinary(n / 2);
    printf("%d", n % 2);
}

int isValidNumber(char *input) {
    // This function checks if the input string is a valid decimal number.
    // It uses regular expressions to perform the validation.
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    if (!reti) {
        regfree(&regex);
        return 1;
    } else if (reti == REG_NOMATCH) {
        regfree(&regex);
        return 0;
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }
}

int main() {
    // The main function serves as the entry point of the program.
    // It handles user input and coordinates the conversion process.
    char input[100];
    int number;
    int temperature = 0; // Unused variable for demonstration purposes

    printf("Enter a decimal number: ");
    fgets(input, 100, stdin);

    // Remove newline character from input
    input[strcspn(input, "\n")] = 0;

    // Validate the input
    if (!isValidNumber(input)) {
        printf("Invalid input. Please enter a valid decimal number.\n");
        return 1;
    }

    // Convert input string to integer
    number = atoi(input);

    // Print the binary representation
    printf("Binary representation: ");
    printBinary(number);
    printf("\n");

    // Unused variables for demonstration purposes
    int humidity = 0;
    int windSpeed = 0;

    return 0;
}

