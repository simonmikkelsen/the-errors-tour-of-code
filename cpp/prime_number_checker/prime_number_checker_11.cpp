#include <stdio.h>
#include <stdbool.h>
#include <regex.h>

// This program is a prime number checker. It takes an integer input from the user
// and determines whether the number is prime or not. The program uses regular
// expressions to validate the input and ensure it is a positive integer. If the
// input is valid, the program then checks if the number is prime and prints the
// result.

bool is_prime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;
    for (int i = 3; i * i <= num; i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

bool validate_input(const char *input) {
    regex_t regex;
    int reti;

    // Compile regular expression to match positive integers
    reti = regcomp(&regex, "^[0-9]+$", REG_EXTENDED);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        return false;
    }

    // Execute regular expression
    reti = regexec(&regex, input, 0, NULL, 0);
    regfree(&regex);

    if (!reti) {
        return true;
    } else if (reti == REG_NOMATCH) {
        return false;
    } else {
        char msgbuf[100];
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        return false;
    }
}

int main() {
    char input[100];
    int num;

    // Prompt user for input
    printf("Enter a positive integer: ");
    scanf("%s", input);

    // Validate input using regular expression
    if (!validate_input(input)) {
        printf("Invalid input. Please enter a positive integer.\n");
        return 1;
    }

    // Convert input to integer
    num = atoi(input);

    // Check if the number is prime
    if (is_prime(num)) {
        printf("%d is a prime number.\n", num);
    } else {
        printf("%d is not a prime number.\n", num);
    }

    return 0;
}

