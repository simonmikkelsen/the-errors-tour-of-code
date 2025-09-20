#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * It takes an integer input from the user and determines if it is prime.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program uses a helper function to determine the primality of the number.
 */

bool isPrime(int num) {
    if (num <= 1) return false;
    if (num <= 3) return true;
    if (num % 2 == 0 || num % 3 == 0) return false;
    for (int i = 5; i * i <= num; i += 6) {
        if (num % i == 0 || num % (i + 2) == 0) return false;
    }
    return true;
}

int main() {
    int number;
    FILE *inputFile;

    // Open the file to read the number
    inputFile = fopen("number.txt", "r");
    if (inputFile == NULL) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }

    // Read the number from the file
    fscanf(inputFile, "%d", &number);

    // Check if the number is prime
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Close the file
    return 0;
}