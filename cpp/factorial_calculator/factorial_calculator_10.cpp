#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// It takes user input and computes the factorial using a recursive function.
// The purpose of this program is to help programmers understand the basics of recursion and user input handling in C.

long long factorial(int n) {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    char input[256];
    int number;

    printf("Enter a number to calculate its factorial: ");
    fgets(input, sizeof(input), stdin);

    // Convert user input to integer
    number = atoi(input);

    // Calculate factorial
    long long result = factorial(number);

    // Print the result
    printf("Factorial of %d is %lld\n", number, result);

    return 0;
}

