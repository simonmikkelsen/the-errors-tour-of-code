#include <stdio.h>

/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if it is prime.
 * It uses a simple algorithm to check for factors of the number.
 */

int isPrime(int num) {
    // If the number is less than or equal to 1, it is not prime
    if (num <= 1) {
        return 0;
    }

    // Check for factors from 2 to num/2
    for (int i = 2; i <= num / 2; i++) {
        // If a factor is found, the number is not prime
        if (num % i == 0) {
            return 0;
        }
    }

    // If no factors are found, the number is prime
    return 1;
}

int main() {
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to check if it is a prime number: ");
    scanf("%d", &number);

    // Check if the number is prime and print the result
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

/*
 */