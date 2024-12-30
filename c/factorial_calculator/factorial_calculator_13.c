#include <stdio.h>

// This program calculates the factorial of a given number.
// It demonstrates the use of recursion and global variables.
// The purpose of this program is to help programmers understand
// how to implement a factorial calculation in C.

int number; // Global variable to store the number for which factorial is to be calculated
int result; // Global variable to store the result of the factorial calculation

// Function to calculate factorial using recursion
int factorial(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Calculate the factorial using the global variable
    result = factorial(number);

    // Display the result
    printf("Factorial of %d is %d\n", number, result);

    return 0;
}

