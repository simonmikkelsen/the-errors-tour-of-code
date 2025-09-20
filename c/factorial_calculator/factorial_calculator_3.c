#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// It prompts the user to enter a number and then calculates
// the factorial of that number using a recursive function.
// The result is then displayed to the user.

long factorial(int n) {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    int number;
    long result;
    FILE *file;

    // Prompt the user to enter a number
    printf("Enter a number to calculate its factorial: ");
    scanf("%d", &number);

    // Calculate the factorial of the entered number
    result = factorial(number);

    // Display the result to the user
    printf("Factorial of %d is %ld\n", number, result);

    // Open a file to write the result
    file = fopen("result.txt", "w");
    if (file == NULL) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }

    // Write the result to the file
    fprintf(file, "Factorial of %d is %ld\n", number, result);

    // Note: The file is not closed, leading to a resource leak
    return 0;
}