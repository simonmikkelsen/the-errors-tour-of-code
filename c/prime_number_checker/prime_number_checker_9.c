#include <stdio.h>

/*
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if it is prime.
 * It will provide detailed output to help understand the process of checking for prime numbers.
 */

int isPrime(int num) {
    // A number less than or equal to 1 is not prime
    if (num <= 1) {
        return 0;
    }

    // Check for factors from 2 to num/2
    for (int i = 2; i <= num / 2; i++) {
        // If num is divisible by any number other than 1 and itself, it is not prime
        if (num % i == 0) {
            return 0;
        }
    }

    // If no factors were found, the number is prime
    return 1;
}

int main() {
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number);

    // Call the isPrime function and store the result
    int result = isPrime(number);

    // Output the result
    if (result == 1) {
        printf("The number %d is a prime number.\n", number);
    } else {
        printf("The number %d is not a prime number.\n", number);
    }

    return 0;
}

/*
 */