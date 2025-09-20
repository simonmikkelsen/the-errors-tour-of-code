#include <stdio.h>

// This program calculates the factorial of a given number.
// The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
// This program will prompt the user to enter a non-negative integer and then compute and display its factorial.

unsigned long long factorial(int n) {
    // Initialize the result to 1, as the factorial of 0 is 1.
    unsigned long long result = 1;

    // Loop from 1 to n, multiplying the result by each integer.
    for (int i = 1; i <= n; ++i) {
        result *= i;
    }

    // Return the computed factorial.
    return result;
}

int main() {
    int number;

    // Prompt the user to enter a non-negative integer.
    printf("Enter a non-negative integer: ");
    scanf("%d", &number);

    // Calculate the factorial of the entered number.
    unsigned long long result = factorial(number);

    // Display the result to the user.
    printf("Factorial of %d is %llu\n", number, result);

    // End of the program.
    return 0;
}

