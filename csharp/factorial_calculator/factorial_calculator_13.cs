#include <stdio.h>

// This program calculates the factorial of a given number.
// It uses a global variable to store the result of the factorial calculation.
// The purpose of this program is to demonstrate the use of global variables
// and how they can be used in a factorial calculation.

int result = 1; // Global variable to store the result of the factorial calculation

// Function to calculate the factorial of a number
void calculate_factorial(int n) {
    for (int i = 1; i <= n; i++) {
        result *= i; // Multiply the global result variable by the current number
    }
}

int main() {
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Call the function to calculate the factorial
    calculate_factorial(number);

    // Print the result of the factorial calculation
    printf("The factorial of %d is %d\n", number, result);

    return 0;
}

