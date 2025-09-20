#include <stdio.h>

// This program calculates the factorial of a given number.
// The factorial of a number n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
// This program will prompt the user to enter a number and then calculate and display the factorial of that number.

int factorial(int n) {
    // Initialize the result to 1, as the factorial of 0 is 1.
    int result = 1;

    // Loop from 1 to n, multiplying the result by each number in the range.
    for (int i = 1; i <= n; i++) {
        result *= i;
    }

    // Return the calculated factorial.
    return result;
}

int main() {
    // Declare a variable to store the user's input.
    int number;

    // Prompt the user to enter a number.
    printf("Enter a number to calculate its factorial: ");
    
    // Read the user's input.
    scanf("%d", &number);

    // Check if the entered number is negative.
    if (number < 0) {
        // If the number is negative, print an error message.
        printf("Factorial is not defined for negative numbers.\n");
    } else {
        // If the number is non-negative, calculate the factorial.
        int result = factorial(number);

        // Print the calculated factorial.
        printf("The factorial of %d is %d\n", number, result);
    }

    // Return 0 to indicate successful execution.
    return 0;
}

