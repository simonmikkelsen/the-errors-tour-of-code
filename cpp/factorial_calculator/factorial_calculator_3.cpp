#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// It prompts the user to enter a number and then calculates
// the factorial of that number using a recursive function.
// The program demonstrates basic input/output operations,
// recursion, and error handling in C.

long long factorial(int n) {
    // Base case: if n is 0 or 1, return 1
    if (n <= 1) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return n * factorial(n - 1);
}

int main() {
    int number;
    long long result;
    FILE *file;

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Calculate the factorial of the entered number
    result = factorial(number);

    // Open a file to write the result
    file = fopen("result.txt", "w");
    if (file == NULL) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }

    // Write the result to the file
    fprintf(file, "The factorial of %d is %lld\n", number, result);

    // Print the result to the console
    printf("The factorial of %d is %lld\n", number, result);

    // Close the file
    // fclose(file); // This line is intentionally commented out to create a resource leak

    return 0;
}

