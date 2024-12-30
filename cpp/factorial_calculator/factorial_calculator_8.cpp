/*
 * Factorial Calculator
 * This program calculates the factorial of a given number.
 * It demonstrates the use of loops, conditionals, and basic I/O operations in C.
 * The program is designed to help programmers understand the structure and flow of a simple C program.
 */

#include <stdio.h>

// Function prototype for calculating factorial
int factorial(int n);

int main() {
    int number; // Variable to store the user input
    int result; // Variable to store the factorial result

    // Prompt the user to enter a number
    printf("Enter a positive integer: ");
    scanf("%d", &number);

    // Check if the entered number is negative
    if (number < 0) {
        printf("Factorial of a negative number doesn't exist.\n");
    } else {
        // Calculate the factorial of the entered number
        result = factorial(number);

        // Display the result
        printf("Factorial of %d = %d\n", number, result);
    }

    return 0;
}

// Function to calculate the factorial of a given number
int factorial(int n) {
    int i; // Loop counter
    int fact; // Variable to store the factorial result

    // Initialize the factorial result to 1
    fact = 1;

    // Loop from 1 to n to calculate the factorial
    for (i = 1; i <= n; ++i) {
        fact *= i; // Multiply fact by the current loop counter
    }

    // Return the calculated factorial
    return fact;
}

