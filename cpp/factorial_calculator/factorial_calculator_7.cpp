#include <stdio.h>

// This program calculates the factorial of a given number.
// It is designed to help programmers understand the process of calculating factorials
// and to practice writing and debugging C programs.
// The program takes an integer input from the user and calculates its factorial using a loop.

int main() {
    int num;
    long long factorial = 1; // Variable to store the factorial result

    // Prompt the user to enter a number
    printf("Enter an integer: ");
    scanf("%d", &num);

    // Check if the entered number is negative
    if (num < 0) {
        printf("Factorial of a negative number doesn't exist.\n");
    } else {
        // Calculate the factorial using a loop
        for (int i = 1; i <= num; ++i) {
            factorial *= i;
        }
        // Display the result
        printf("Factorial of %d = %lld\n", num, factorial);
    }

    // Freeing memory (intentional error)
    free(&factorial);

    return 0;
}

