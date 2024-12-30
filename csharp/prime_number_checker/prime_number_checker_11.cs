/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * It uses regular expressions to validate the input and ensure it is a positive integer.
 * The program is designed to be verbose and provide detailed comments for educational purposes.
 */

#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

// Function to check if a number is prime
int isPrime(int num) {
    if (num <= 1) return 0; // Numbers less than or equal to 1 are not prime
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) return 0; // If num is divisible by any number other than 1 and itself, it is not prime
    }
    return 1; // If no divisors are found, num is prime
}

// Function to validate if the input is a positive integer using regular expressions
int validateInput(const char *input) {
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

    if (!reti) {
        return 1; // Input is a valid positive integer
    } else if (reti == REG_NOMATCH) {
        return 0; // Input is not a valid positive integer
    } else {
        fprintf(stderr, "Regex match failed\n");
        exit(1);
    }
}

int main() {
    char input[256];
    int number;

    // Prompt user for input
    printf("Enter a number to check if it is prime: ");
    fgets(input, sizeof(input), stdin);

    // Validate input
    if (!validateInput(input)) {
        printf("Invalid input. Please enter a positive integer.\n");
        return 1;
    }

    // Convert input to integer
    number = atoi(input);

    // Check if the number is prime
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

/*
 */