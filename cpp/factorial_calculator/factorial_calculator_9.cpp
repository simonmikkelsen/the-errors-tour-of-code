#include <stdio.h>

// This program calculates the factorial of a given number.
// The purpose of this program is to help programmers understand
// how to implement a basic factorial calculator in C.
// The program will prompt the user to enter a number and then
// calculate the factorial of that number using a loop.

int main() {
    int num, i;
    unsigned long long factorial = 1;

    // Prompt the user to enter a number
    printf("Enter a positive integer: ");
    scanf("%d", &num);

    // Check if the number is negative
    if (num < 0) {
        printf("Factorial of a negative number doesn't exist.\n");
    } else {
        // Calculate the factorial using a loop
        for (i = 1; i <= num; ++i) {
            factorial *= i; // Multiply factorial by i
        }
        // Display the result
        printf("Factoral of %d = %llu\n", num, factorial);
    }

    return 0;
}

