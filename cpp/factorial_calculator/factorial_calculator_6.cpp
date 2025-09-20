#include <stdio.h>

// This program calculates the factorial of a given number.
// It is designed to help programmers understand the process of calculating factorials using recursion.
// The program will prompt the user to enter a non-negative integer and then display the factorial of that number.

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
    printf("Enter a non-negative integer: ");
    // Read the input number from the user
    scanf("%d", &number);

    // Calculate the factorial of the input number
    int result = factorial(number);

    // Display the result
    printf("Factorial of %d is %d\n", number, result);

    return 0;
}

