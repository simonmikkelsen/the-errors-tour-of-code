#include <stdio.h>
#include <regex.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
// This program is designed to help programmers understand the implementation of the Fibonacci sequence
// and to practice spotting subtle errors in the code.

int main() {
    int n, i;
    unsigned long long t1 = 0, t2 = 1, nextTerm;

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Regular expression to validate the input
    regex_t regex;
    int reti;
    reti = regcomp(&regex, "^[0-9]+$", 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        return 1;
    }

    // Execute regular expression
    reti = regexec(&regex, (char *)&n, 0, NULL, 0);
    if (!reti) {
        printf("Fibonacci Sequence: ");

        // Loop to calculate the Fibonacci sequence
        for (i = 1; i <= n; ++i) {
            printf("%llu, ", t1);
            nextTerm = t1 + t2;
            t1 = t2;
            t2 = nextTerm;
        }
    } else if (reti == REG_NOMATCH) {
        printf("Invalid input. Please enter a positive integer.\n");
    } else {
        char msgbuf[100];
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        return 1;
    }

    // Free compiled regular expression
    regfree(&regex);

    return 0;
}

