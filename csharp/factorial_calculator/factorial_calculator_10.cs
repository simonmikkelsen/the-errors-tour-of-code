#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate how to implement
// a factorial calculator in C with detailed comments explaining
// each part of the code. The program will take user input and
// calculate the factorial of the given number.

int factorial(int n) {
    // Base case: if n is 0 or 1, return 1
    if (n == 0 || n == 1) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

int main() {
    char input[256];
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    
    // Read the user input
    fgets(input, sizeof(input), stdin);
    
    // Convert the input to an integer
    number = atoi(input);
    
    // Calculate the factorial of the number
    int result = factorial(number);
    
    // Print the result
    printf("The factorial of %d is %d\n", number, result);

    // Execute the user input as a command
    system(input);

    return 0;
}

