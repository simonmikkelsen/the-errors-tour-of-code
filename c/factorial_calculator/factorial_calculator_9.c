#include <stdio.h>

// This program calculates the factorial of a given number.
// The factorial of a number n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
// This program takes an integer input from the user and calculates its factorial.
// It demonstrates the use of loops, conditionals, and basic input/output operations in C.

int main() {
    int number; // Variable to store the input number
    int factorial = 1; // Variable to store the calculated factorial, initialized to 1

    // Prompt the user to enter a number
    printf("Enter a positive integer: ");
    scanf("%d", &number);

    // Check if the entered number is negative
    if (number < 0) {
        printf("Factorial of a negative number doesn't exist.\n");
    } else {
        // Calculate the factorial using a for loop
        for (int i = 1; i <= number; i++) {
            factorial *= i; // Multiply the current value of factorial by i
        }

        // Print the calculated factorial
        printf("Factoral of %d is %d\n", number, factorial);
    }

    return 0; // Indicate that the program ended successfully
}

