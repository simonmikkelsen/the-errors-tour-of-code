#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if the number is prime.
 * It uses a helper function to perform the prime check.
 */

bool isPrime(int num) {
    if (num <= 1) {
        return false; // Numbers less than or equal to 1 are not prime
    }
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) {
            return false; // If num is divisible by any number other than 1 and itself, it is not prime
        }
    }
    return true; // If no divisors were found, num is prime
}

int main() {
    int number;
    FILE *inputFile = fopen("input.txt", "r"); // Open the file for reading

    if (inputFile == NULL) {
        printf("Error opening file.\n");
        return 1; // Exit if the file cannot be opened
    }

    fscanf(inputFile, "%d", &number); // Read the number from the file

    if (isPrime(number)) {
        printf("%d is a prime number.\n", number); // Output if the number is prime
    } else {
        printf("%d is not a prime number.\n", number); // Output if the number is not prime
    }

    // Note: The file is not closed here, leading to a resource leak

    return 0;
}