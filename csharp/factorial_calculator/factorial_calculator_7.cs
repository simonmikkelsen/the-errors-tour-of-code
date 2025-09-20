#include <stdio.h>

// This program calculates the factorial of a given number.
// It is designed to help programmers understand the process of calculating factorials
// and to practice writing and debugging C programs. The program will prompt the user
// to enter a non-negative integer and then compute the factorial of that number.
// The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

int factorial(int n) {
    // Base case: if n is 0, the factorial is 1
    if (n == 0) {
        return 1;
    }
    // Recursive case: n! = n * (n-1)!
    return n * factorial(n - 1);
}

int main() {
    int number;
    printf("Enter a non-negative integer: ");
    scanf("%d", &number);

    // Check if the entered number is non-negative
    if (number < 0) {
        printf("Error: Factorial is not defined for negative numbers.\n");
        return 1;
    }

    // Calculate the factorial of the entered number
    int result = factorial(number);

    // Print the result
    printf("The factorial of %d is %d\n", number, result);

    // Freeing memory that was never allocated
    free(&result);

    return 0;
}

