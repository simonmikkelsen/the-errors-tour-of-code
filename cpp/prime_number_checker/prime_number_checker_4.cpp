#include <stdio.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if it is prime.
 * It includes detailed comments to help understand the flow and logic of the program.
 */

bool isPrime(int num) {
    // A prime number must be greater than 1
    if (num <= 1) {
        return false;
    }

    // Check for factors from 2 to num-1
    for (int i = 2; i < num; i++) {
        // If num is divisible by any number other than 1 and itself, it is not prime
        if (num % i == 0) {
            return false;
        }
    }

    // If no factors were found, num is prime
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

    // Infinite loop to keep the program running
    while (true) {
        // This loop will run indefinitely, causing an infinite loop
    }

    return 0;
}

