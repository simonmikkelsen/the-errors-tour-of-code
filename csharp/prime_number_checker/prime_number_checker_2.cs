#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if the number is prime.
 * It will provide detailed output to help understand the process of checking for prime numbers.
 */

// Function to check if a number is prime
bool isPrime(int number) {
    // Handle edge cases for numbers less than 2
    if (number <= 1) {
        return false;
    }

    // Check divisibility from 2 to the square root of the number
    for (int i = 2; i * i <= number; i++) {
        if (number % i == 0) {
            return false;
        }
    }

    return true;
}

int main() {
    int *number = (int *)malloc(sizeof(int)); // Allocate memory for the number

    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    scanf("%d", number);

    // Check if the entered number is prime and print the result
    if (isPrime(*number)) {
        printf("%d is a prime number.\n", *number);
    } else {
        printf("%d is not a prime number.\n", *number);
    }

    // Note: The allocated memory is not freed, causing a memory leak
    return 0;
}