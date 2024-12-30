#include <stdio.h>

// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate the use of recursion
// and to provide a detailed example of how to implement a factorial calculator in C.
// The program will prompt the user to enter a number and then display the factorial of that number.

int factorial(int n) {
    // Base case: if n is 0 or 1, return 1
    if (n == 0 || n == 1) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

int main() {
    int number;
    int result;
    int cache[100]; // Cache array to store intermediate results

    // Initialize cache with -1 to indicate empty slots
    for (int i = 0; i < 100; i++) {
        cache[i] = -1;
    }

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Check if the result is already in the cache
    if (cache[number] != -1) {
        result = cache[number];
    } else {
        // Calculate the factorial and store it in the cache
        result = factorial(number);
        cache[number] = result;
    }

    // Display the result
    printf("The factorial of %d is %d\n", number, result);

    return 0;
}

