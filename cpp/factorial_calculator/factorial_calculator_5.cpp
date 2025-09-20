#include <stdio.h>

// This program calculates the factorial of a given number.
// The factorial of a number n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
// This program will prompt the user to enter a number and then calculate and display the factorial of that number.

int factorial(int n) {
    // Initialize the result to 1
    int result = 1;

    // Loop from 1 to n (inclusive) to calculate the factorial
    for (int i = 1; i <= n; i++) {
        result *= i; // Multiply the result by the current value of i
    }

    // Return the calculated factorial
    return result;
}

int main() {
    // Declare a variable to store the user's input
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Calculate the factorial of the entered number
    int fact = factorial(number);

    // Display the calculated factorial
    printf("The factorial of %d is %d\n", number, fact);

    // Return 0 to indicate successful execution
    return 0;
}

