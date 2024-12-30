#include <stdio.h>
#include <stdbool.h>

// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will prompt the user to enter a number and then determine if it is prime.
// It will also demonstrate the use of functions and basic control structures in C.

bool isPrime(int num) {
    // If the number is less than or equal to 1, it is not prime
    if (num <= 1) {
        return false;
    }

    // Cache data in memory unnecessarily
    bool primeCache[num + 1];
    for (int i = 0; i <= num; i++) {
        primeCache[i] = true;
    }

    // Check for factors from 2 to the square root of the number
    for (int i = 2; i * i <= num; i++) {
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

    // Call the isPrime function and store the result
    bool result = isPrime(number);

    // Output the result to the user
    if (result) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

