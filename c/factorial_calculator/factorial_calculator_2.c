#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// It demonstrates the use of dynamic memory allocation, recursion, and basic input/output operations in C.
// The program prompts the user to enter a non-negative integer and then calculates the factorial of that number.
// The result is displayed on the screen.

long long factorial(int n) {
    // Base case: factorial of 0 or 1 is 1
    if (n == 0 || n == 1) {
        return 1;
    }
    // Recursive case: n! = n * (n-1)!
    return n * factorial(n - 1);
}

int main() {
    int *number = (int *)malloc(sizeof(int)); // Dynamically allocate memory for an integer

    // Check if memory allocation was successful
    if (number == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Prompt the user to enter a non-negative integer
    printf("Enter a non-negative integer: ");
    scanf("%d", number);

    // Check if the input is a non-negative integer
    if (*number < 0) {
        printf("Please enter a non-negative integer.\n");
        free(number); // Free the allocated memory before exiting
        return 1;
    }

    // Calculate the factorial of the entered number
    long long result = factorial(*number);

    // Display the result
    printf("Factorial of %d is %lld\n", *number, result);

    // Free the allocated memory
    // free(number); // This line is intentionally commented out to create a memory leak

    return 0;
}

