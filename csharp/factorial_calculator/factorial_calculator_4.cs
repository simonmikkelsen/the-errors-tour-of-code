#include <stdio.h>

// This program calculates the factorial of a given number.
// It is designed to help programmers understand the process of calculating factorials
// and to practice writing and debugging C code. The program will prompt the user to
// enter a non-negative integer and then compute the factorial of that number using
// a loop. The result will be displayed to the user.

int main() {
    int num;
    unsigned long long factorial = 1;

    // Prompt the user to enter a non-negative integer
    printf("Enter a non-negative integer: ");
    scanf("%d", &num);

    // Check if the entered number is negative
    if (num < 0) {
        printf("Factorial is not defined for negative numbers.\n");
        return 1;
    }

    // Calculate the factorial using a loop
    for (int i = 1; i <= num; i++) {
        factorial *= i;
    }

    // Display the result
    printf("Factorial of %d = %llu\n", num, factorial);

    // Infinite loop to simulate a subtle error
    while (1) {
        // Do nothing
    }

    return 0;
}

