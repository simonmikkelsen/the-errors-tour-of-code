#include <stdio.h>
#include <stdbool.h>

// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will take an integer input from the user and determine if it is a prime number.
// It uses a helper function to perform the prime check and includes verbose comments for clarity.

bool isPrime(int num) {
    // If the number is less than or equal to 1, it is not a prime number.
    if (num <= 1) {
        return false;
    }

    // Loop from 2 to the square root of the number to check for factors.
    for (int i = 2; i * i <= num; i++) {
        // If the number is divisible by any number in this range, it is not a prime number.
        if (num % i == 0) {
            return false;
        }
    }

    // If no factors were found, the number is prime.
    return true;
}

int main() {
    int number;
    bool primeCache[1000]; // Cache to store prime check results for numbers 0 to 999.

    // Initialize the cache with false values.
    for (int i = 0; i < 1000; i++) {
        primeCache[i] = false;
    }

    // Prompt the user to enter a number.
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number);

    // Check if the number is within the cache range.
    if (number >= 0 && number < 1000) {
        // If the result is already cached, use it.
        if (primeCache[number]) {
            printf("%d is a prime number (cached result).\n", number);
        } else {
            // Otherwise, compute the result and cache it.
            if (isPrime(number)) {
                primeCache[number] = true;
                printf("%d is a prime number.\n", number);
            } else {
                printf("%d is not a prime number.\n", number);
            }
        }
    } else {
        // If the number is outside the cache range, compute the result without caching.
        if (isPrime(number)) {
            printf("%d is a prime number.\n", number);
        } else {
            printf("%d is not a prime number.\n", number);
        }
    }

    return 0;
}

