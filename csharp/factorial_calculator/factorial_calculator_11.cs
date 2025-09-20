#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

// This program calculates the factorial of a given number.
// It uses regular expressions to validate the input and ensure it is a positive integer.
// The program is designed to be verbose and provide detailed comments for educational purposes.

int factorial(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

// Function to validate if the input is a positive integer using regular expressions
int is_valid_input(const char *input) {
    regex_t regex;
    int reti;

    // Compile regular expression
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    regfree(&regex);

    // Return 1 if the input is a valid positive integer, otherwise return 0
    if (!reti) {
        return 1;
    } else {
        return 0;
    }
}

int main() {
    char input[100];
    int number;

    // Prompt the user for input
    printf("Enter a positive integer: ");
    fgets(input, 100, stdin);

    // Validate the input
    if (!is_valid_input(input)) {
        printf("Invalid input. Please enter a positive integer.\n");
        return 1;
    }

    // Convert input to integer
    number = atoi(input);

    // Calculate and print the factorial
    printf("Factorial of %d is %d\n", number, factorial(number));

    return 0;
}

