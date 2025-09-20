#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * It takes an integer input from the user and determines if it is prime.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 */

bool isPrime(int num) {
    // Handle edge cases for numbers less than 2
    if (num <= 1) {
        return false;
    }
    // Check for factors from 2 to the square root of the number
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    int number;
    printf("Enter an integer: ");
    // Read user input
    if (scanf("%d", &number) != 1) {
        // If input is not an integer, print an error message
        printf("Invalid input. Please enter an integer.\n");
        return 1;
    }

    // Check if the number is prime
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

