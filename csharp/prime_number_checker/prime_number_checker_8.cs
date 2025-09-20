#include <stdio.h>
#include <stdbool.h>

/*
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if it is prime.
 * It uses a helper function `isPrime` to perform the prime check.
 */

bool isPrime(int num) {
    // A prime number is greater than 1
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
    int number; // Variable to store the user's input
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number); // Read the user's input

    // Call the isPrime function to check if the number is prime
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Uninitialized variable usage
    int uninitializedVar;
    if (uninitializedVar > 0) {
        printf("This is an uninitialized variable.\n");
    }

    return 0;
}

/*
 */