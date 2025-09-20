#include <stdio.h>

// This program calculates the factorial of a given number.
// The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
// This program will prompt the user to enter a non-negative integer and then calculate and display its factorial.

int factorial(int n) {
    // Base case: if n is 0, the factorial is 1
    if (n == 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

int main() {
    int number;
    // Prompt the user to enter a non-negative integer
    printf("Enter a non-negative integer: ");
    // Read the integer input from the user
    scanf("%d", &number);

    // Check if the entered number is negative
    if (number < 0) {
        // If the number is negative, print an error message
        printf("Factorial is not defined for negative numbers.\n");
    } else {
        // Calculate the factorial of the entered number
        int result = factorial(number);
        // Display the result
        printf("The factorial of %d is %d\n", number, result);
    }

    // Return 0 to indicate successful execution
    return 0;
}

