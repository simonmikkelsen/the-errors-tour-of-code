#include <stdio.h>

// This program calculates the factorial of a given number.
// The factorial of a number n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
// This program will prompt the user to enter a number and then calculate and display the factorial of that number.

int factorial(int n) {
    // This function calculates the factorial of a given number n.
    // It uses a recursive approach to calculate the factorial.
    // If n is 0 or 1, the factorial is 1.
    // Otherwise, the factorial is n multiplied by the factorial of n-1.
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    int number;
    int result;

    // Prompt the user to enter a number.
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Calculate the factorial of the entered number.
    result = factorial(number);

    // Display the result.
    printf("The factorial of %d is %d\n", number, result);

    // Return 0 to indicate successful execution.
    return 0;
}

