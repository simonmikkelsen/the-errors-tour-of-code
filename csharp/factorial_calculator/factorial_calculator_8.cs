#include <stdio.h>

// This program calculates the factorial of a given number.
// It is designed to help programmers understand the process of calculating factorials
// and to practice writing and debugging C programs.
// The program takes an integer input from the user and outputs the factorial of that number.

int factorial(int n) {
    // Base case: if n is 0, the factorial is 1
    if (n == 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
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

    // Output the result
    printf("Factorial of %d is %d\n", num, result);

    return 0;
}

