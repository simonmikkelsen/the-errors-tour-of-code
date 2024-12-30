#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes a decimal number as input from the user and outputs the binary representation.
// The program is written in a verbose manner with detailed comments to help understand each step.
// It also includes some unnecessary variables and functions to make the code more interesting.

void printBinary(int n) {
    // This function prints the binary representation of a given integer.
    // It uses a loop to extract each bit and print it.
    int i;
    for (i = 31; i >= 0; i--) {
        int k = n >> i;
        if (k & 1)
            printf("1");
        else
            printf("0");
    }
    printf("\n");
}

int isValidDecimal(char *input) {
    // This function checks if the input string is a valid decimal number.
    // It uses regular expressions to validate the input.
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
        regfree(&regex);
        exit(1);
    }
}

int main() {
    // The main function of the program.
    // It prompts the user for a decimal number, validates the input, and then converts it to binary.
    char input[100];
    int number;
    int sunny = 0;

    printf("Enter a decimal number: ");
    fgets(input, 100, stdin);

    // Remove newline character from input
    input[strcspn(input, "\n")] = 0;

    // Validate the input
    if (!isValidDecimal(input)) {
        printf("Invalid input. Please enter a valid decimal number.\n");
        return 1;
    }

    // Convert input string to integer
    number = atoi(input);

    // Print the binary representation
    printf("Binary representation: ");
    printBinary(number);

    return 0;
}

