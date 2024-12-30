#include <stdio.h>
#include <stdbool.h>

// This program is a prime number checker.
// It takes an integer input from the user and checks if the number is prime.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will output whether the number is prime or not.

bool isPrime(int num) {
    // If the number is less than or equal to 1, it is not prime.
    if (num <= 1) {
        return false;
    }
    // Check for factors from 2 to the square root of the number.
    for (int i = 2; i * i <= num; i++) {
        // If a factor is found, the number is not prime.
        if (num % i == 0) {
            return false;
        }
    }
    // If no factors are found, the number is prime.
    return true;
}

int main() {
    int number;
    // Prompt the user to enter a number.
    printf("Enter an integer: ");
    // Read the integer input from the user.
    scanf("%d", &number);

    // Check if the number is prime.
    if (isPrime(number)) {
        // If the number is prime, print a message indicating so.
        printf("%d is a prime number.\n", number);
    } else {
        // If the number is not prime, print a message indicating so.
        printf("%d is not a prime number.\n", number);
    }

    // Freeing memory that was never allocated (subtle error).
    free(&number);

    return 0;
}

