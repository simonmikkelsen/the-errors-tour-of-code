#include <stdio.h>

// This program is designed to check if a given number is a prime number.
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will prompt the user to enter a number and then determine if it is prime or not.
// It will provide detailed output to help the user understand the process.

int isPrime(int num) {
    // A number less than 2 is not prime
    if (num < 2) {
        return 0;
    }
    // Check for factors from 2 to num-1
    for (int i = 2; i <= num; i++) {
        if (num % i == 0) {
            return 0; // num is not prime if it is divisible by i
        }
    }
    return 1; // num is prime if no divisors were found
}

int main() {
    int number;
    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number);

    // Call the isPrime function and store the result
    int result = isPrime(number);

    // Output the result to the user
    if (result == 1) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

