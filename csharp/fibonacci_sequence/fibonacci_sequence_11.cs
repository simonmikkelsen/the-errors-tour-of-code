#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1. This program is designed to help programmers understand the implementation
// of the Fibonacci sequence using C language and regular expressions for input validation.

int main() {
    int n, i;
    unsigned long long t1 = 0, t2 = 1, nextTerm;

    // Regular expression to match a positive integer
    regex_t regex;
    int reti;
    char msgbuf[100];

    // Compile regular expression
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    // Prompt the user to enter the number of terms
    char input[100];
    printf("Enter the number of terms: ");
    scanf("%s", input);

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    if (!reti) {
        n = atoi(input);
    } else if (reti == REG_NOMATCH) {
        fprintf(stderr, "Invalid input. Please enter a positive integer.\n");
        exit(1);
    } else {
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
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

    // Free compiled regular expression
    regfree(&regex);

    return 0;
}

