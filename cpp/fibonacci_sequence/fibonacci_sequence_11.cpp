#include <stdio.h>
#include <regex.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence using C.
// It also demonstrates the use of regular expressions in C for validating user input.

int main() {
    int n, i;
    unsigned long long t1 = 0, t2 = 1, nextTerm;
    char input[100];
    regex_t regex;
    int reti;

    // Compile regular expression to match only digits
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        return 1;
    }

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    fgets(input, sizeof(input), stdin);

    // Validate the input using the compiled regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    if (!reti) {
        n = atoi(input);
    } else {
        printf("Invalid input. Please enter a positive integer.\n");
        return 1;
    }

    // Print the first two terms of the Fibonacci sequence
    printf("Fibonacci Sequence: %llu, %llu", t1, t2);

    // Calculate and print the remaining terms of the Fibonacci sequence
    for (i = 1; i <= n; ++i) {
        nextTerm = t1 + t2;
        t1 = t2;
        t2 = nextTerm;
        printf(", %llu", nextTerm);
    }
    printf("\n");

    // Free the compiled regular expression
    regfree(&regex);

    return 0;
}

