#include <stdio.h>
#include <stdbool.h>
#include <regex.h>

// This program is designed to check if a given number is a prime number.
// It uses regular expressions to validate the input and ensure it is a positive integer.
// The program will prompt the user to enter a number and then determine if it is prime.
// Prime numbers are numbers greater than 1 that have no divisors other than 1 and themselves.

// Function to validate if the input is a positive integer using regular expressions
bool isValidNumber(const char *input) {
    regex_t regex;
    int reti;

    // Compile regular expression
    reti = regcomp(&regex, "^[1-9][0-9]*$", REG_EXTENDED);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        return false;
    }

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    regfree(&regex);

    // Return true if the input matches the regular expression
    return !reti;
}

// Function to check if a number is prime
bool isPrime(int num) {
    if (num <= 1) {
        return false;
    }
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    char input[100];
    int number;

    // Prompt the user to enter a number
    printf("Enter a number: ");
    scanf("%s", input);

    // Validate the input
    if (!isValidNumber(input)) {
        printf("Invalid input. Please enter a positive integer.\n");
        return 1;
    }

    // Convert the input to an integer
    sscanf(input, "%d", &number);

    // Check if the number is prime
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

