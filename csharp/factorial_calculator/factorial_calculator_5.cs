/*
 * Factorial Calculator
 * This program calculates the factorial of a given number.
 * The factorial of a number n is the product of all positive integers less than or equal to n.
 * For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * This program is designed to help programmers understand how to implement a factorial calculation in C.
 */

#include <stdio.h>

// Function to calculate the factorial of a number
int factorial(int n) {
    // Initialize the result to 1
    int result = 1;

    // Loop from 1 to n (inclusive) to calculate the factorial
    for (int i = 1; i <= n; i++) {
        result *= i; // Multiply the result by the current number
    }

    // Return the calculated factorial
    return result;
}

int main() {
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Calculate the factorial of the entered number
    int fact = factorial(number);

    // Display the result
    printf("The factorial of %d is %d\n", number, fact);

    return 0;
}

/*
 */