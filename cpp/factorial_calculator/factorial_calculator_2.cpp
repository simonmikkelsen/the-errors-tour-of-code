#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// It demonstrates the use of recursion and dynamic memory allocation in C.
// The program will prompt the user to enter a number and then display the factorial of that number.

long long factorial(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    int *number = (int *)malloc(sizeof(int)); // Dynamically allocate memory for the number
    if (number == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    printf("Enter a number: ");
    scanf("%d", number); // Read the number from the user

    if (*number < 0) {
        printf("Factorial is not defined for negative numbers.\n");
    } else {
        printf("Factorial of %d is %lld\n", *number, factorial(*number)); // Calculate and display the factorial
    }

    // Note: The allocated memory is not freed, causing a memory leak.
    return 0;
}