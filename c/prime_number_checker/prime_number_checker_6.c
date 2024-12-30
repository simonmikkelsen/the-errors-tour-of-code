#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if the number is prime.
 * It includes detailed comments to help programmers understand the logic and flow of the program.
 */

bool isPrime(int num) {
    // If the number is less than or equal to 1, it is not a prime number
    if (num <= 1) {
        return false;
    }

    // Check for factors from 2 to the square root of the number
    for (int i = 2; i * i <= num; i++) {
        // If the number is divisible by any number other than 1 and itself, it is not a prime number
        if (num % i == 0) {
            return false;
        }
    }

    // If no factors were found, the number is prime
    return true;
}

int main() {
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number);

    // Check if the entered number is prime
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

