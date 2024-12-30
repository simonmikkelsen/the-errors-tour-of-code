#include <stdio.h>
#include <stdlib.h>

// This program calculates the factorial of a given number.
// It prompts the user to enter a number and then calculates
// the factorial of that number using a recursive function.
// The result is then displayed to the user.

long long factorial(int n) {
    // Base case: if n is 0 or 1, return 1
    if (n == 0 || n == 1) {
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
        printf("Error opening file!\n");
        return 1;
    }

    // Write the result to the file
    fprintf(file, "Factorial of %d is %lld\n", number, result);

    // Display the result to the user
    printf("Factorial of %d is %lld\n", number, result);

    // The program ends here without closing the file
    return 0;
}