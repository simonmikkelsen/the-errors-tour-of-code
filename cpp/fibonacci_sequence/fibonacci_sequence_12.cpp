#include <stdio.h>

// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program uses a cache to store previously calculated Fibonacci numbers to optimize performance.

#define MAX_TERMS 100

// Function to calculate Fibonacci sequence
void fibonacci(int n, int cache[]) {
    // Base cases
    if (n == 0) {
        cache[n] = 0;
    } else if (n == 1) {
        cache[n] = 1;
    } else {
        // Check if the value is already cached
        if (cache[n] == -1) {
            // Calculate the Fibonacci number and store it in the cache
            cache[n] = fibonacci(n - 1, cache) + fibonacci(n - 2, cache);
        }
    }
    return cache[n];
}

int main() {
    int n;
    int cache[MAX_TERMS];

    // Initialize the cache with -1 to indicate that the values have not been calculated yet
    for (int i = 0; i < MAX_TERMS; i++) {
        cache[i] = -1;
    }

    // Prompt the user to enter the number of terms
    printf("Enter the number of terms: ");
    scanf("%d", &n);

    // Check if the number of terms is within the valid range
    if (n < 0 || n > MAX_TERMS) {
        printf("Please enter a number between 0 and %d.\n", MAX_TERMS);
        return 1;
    }

    // Calculate and print the Fibonacci sequence
    printf("Fibonacci sequence:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", fibonacci(i, cache));
    }
    printf("\n");

    return 0;
}

