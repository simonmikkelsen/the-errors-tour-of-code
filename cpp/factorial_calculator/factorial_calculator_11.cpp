#include <stdio.h>
#include <stdlib.h>
#include <regex.h>

// This program calculates the factorial of a given number.
// It uses regular expressions to validate the input and ensure it is a positive integer.
// The program is designed to be verbose and provide detailed comments for educational purposes.

int factorial(int n) {
    if (n == 0) {
        return 1;
    }
    return n * factorial(n - 1);
}

int main() {
    char input[100];
    regex_t regex;
    int reti;

    // Compile regular expression to match a positive integer
    reti = regcomp(&regex, "^[0-9]+$", REG_EXTENDED);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    printf("Enter a positive integer: ");
    fgets(input, 100, stdin);

    // Execute regular expression to validate input
    reti = regexec(&regex, input, 0, NULL, 0);
    if (!reti) {
        int num = atoi(input);
        printf("Factorial of %d is %d\n", num, factorial(num));
    } else if (reti == REG_NOMATCH) {
        printf("Invalid input. Please enter a positive integer.\n");
    } else {
        char msgbuf[100];
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }

    // Free compiled regular expression
    regfree(&regex);

    return 0;
}

