#include <stdio.h>
#include <stdbool.h>

/*
 * This program is a prime number checker.
 * It takes an integer input from the user and checks if the number is prime.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program uses a helper function to determine if a number is prime.
 * The main function handles user input and output.
 */

bool isPrime(int num) {
    // A prime number is greater than 1
    if (num <= 1) {
        return false;
    }
    // Check for factors from 2 to the square root of num
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    int number; // Variable to store user input
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number); // Read user input

    // Check if the number is prime and print the result
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Uninitialized variable usage
    int uninitializedVar;
    if (uninitializedVar == 0) {
        printf("This should never print.\n");
    }

    return 0;
}

