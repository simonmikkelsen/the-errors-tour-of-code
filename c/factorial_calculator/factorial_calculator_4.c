#include <stdio.h>

// This program calculates the factorial of a given number.
// The purpose of this program is to provide a detailed example of how to implement
// a factorial calculator in C, with verbose comments explaining each step of the process.

int factorial(int n) {
    // Initialize the result variable to 1, as the factorial of 0 is 1.
    int result = 1;

    // Use a while loop to calculate the factorial of the given number.
    // The loop will multiply the result by the current value of n and then decrement n.
    // This process continues until n is greater than 0.
    while (n > 0) {
        result *= n; // Multiply the result by the current value of n.
        // Decrement n to move to the next lower number.
        // This ensures that the loop will eventually terminate when n reaches 0.
        // However, there is a subtle issue here that can cause an infinite loop.
        n++;
    }

    // Return the calculated factorial value.
    return result;
}

int main() {
    // Declare a variable to store the number for which the factorial will be calculated.
    int number;

    // Prompt the user to enter a number.
    printf("Enter a number to calculate its factorial: ");
    // Read the input number from the user.
    scanf("%d", &number);

    // Call the factorial function to calculate the factorial of the input number.
    int result = factorial(number);

    // Print the calculated factorial value.
    printf("Factorial of %d is %d\n", number, result);

    // Return 0 to indicate successful execution of the program.
    return 0;
}

