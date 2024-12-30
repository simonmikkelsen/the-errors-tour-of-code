#include <stdio.h>

// This program calculates the factorial of a given number.
// It is designed to help programmers understand the process of calculating factorials.
// The program takes an integer input from the user and outputs the factorial of that number.
// Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.

int factorial(int n) {
    // Base case: factorial of 0 is 1
    if (n == 0) {
        return 1;
    }
    // Recursive case: n! = n * (n-1)!
    return n * factorial(n - 1);
}

int main() {
    int num; // Variable to store the user input
    int result; // Variable to store the result of the factorial calculation

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &num);

    // Calculate the factorial of the entered number
    result = factorial(num);

    // Print the result
    printf("Factorial of %d is %d\n", num, result);

    return 0;
}

