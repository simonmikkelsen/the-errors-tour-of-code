#include <stdio.h>

// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate the use of recursion
// and caching in memory to store intermediate results for optimization.
// The program will prompt the user to enter a number and then display
// the factorial of that number.

#define MAX 100

// Function prototype for calculating factorial
unsigned long long factorial(int n);

// Cache array to store intermediate results
unsigned long long cache[MAX];

int main() {
    int number;

    // Initialize cache with zeros
    for (int i = 0; i < MAX; i++) {
        cache[i] = 0;
    }

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Check if the number is within the valid range
    if (number < 0 || number >= MAX) {
        printf("Invalid input! Please enter a number between 0 and %d.\n", MAX - 1);
        return 1;
    }

    // Calculate the factorial of the number
    unsigned long long result = factorial(number);

    // Display the result
    printf("Factorial of %d is %llu\n", number, result);

    return 0;
}

// Function to calculate factorial using recursion and caching
unsigned long long factorial(int n) {
    // Base case: factorial of 0 is 1
    if (n == 0) {
        return 1;
    }

    // Check if the result is already cached
    if (cache[n] != 0) {
        return cache[n];
    }

    // Calculate the factorial recursively
    unsigned long long result = n * factorial(n - 1);

    // Cache the result
    cache[n] = result;

    return result;
}

