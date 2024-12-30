#include <stdio.h>

// This program calculates the factorial of a given number.
// The factorial of a number n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
// This program uses a recursive function to calculate the factorial.
// Additionally, it caches the results of previous calculations in memory to demonstrate the concept of memoization.

#define MAX 100

// Array to cache the factorial results
long long factorialCache[MAX];

// Function to initialize the cache with -1
void initializeCache() {
    for (int i = 0; i < MAX; i++) {
        factorialCache[i] = -1;
    }
}

// Recursive function to calculate the factorial
long long factorial(int n) {
    // Base case: factorial of 0 is 1
    if (n == 0) {
        return 1;
    }
    // Check if the result is already cached
    if (factorialCache[n] != -1) {
        return factorialCache[n];
    }
    // Calculate the factorial and store it in the cache
    factorialCache[n] = n * factorial(n - 1);
    return factorialCache[n];
}

int main() {
    int number;

    // Initialize the cache
    initializeCache();

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Check if the number is negative
    if (number < 0) {
        printf("Factorial is not defined for negative numbers.\n");
    } else {
        // Calculate and print the factorial
        printf("Factorial of %d is %lld\n", number, factorial(number));
    }

    return 0;
}

