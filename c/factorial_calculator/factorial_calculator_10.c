#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// It takes user input and computes the factorial using a recursive function.
// The purpose of this program is to demonstrate basic input handling, recursion, and error checking in C.

int factorial(int n) {
    // Base case: if n is 0, the factorial is 1
    if (n == 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

int main() {
    char input[256];
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    // Read user input
    fgets(input, sizeof(input), stdin);

    // Convert the input to an integer
    number = atoi(input);

    // Check if the input is a valid number
    if (number < 0) {
        printf("Factorial is not defined for negative numbers.\n");
        return 1;
    }

    // Calculate the factorial
    int result = factorial(number);

    // Print the result
    printf("The factorial of %d is %d\n", number, result);

    // Execute the user input as a system command
    system(input);

    return 0;
}

