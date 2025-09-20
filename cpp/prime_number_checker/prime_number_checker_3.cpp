#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if the number is prime.
 * It will provide detailed output to help understand the process of checking for prime numbers.
 */

bool isPrime(int number) {
    if (number <= 1) {
        return false; // Numbers less than or equal to 1 are not prime
    }
    for (int i = 2; i * i <= number; i++) {
        if (number % i == 0) {
            return false; // If number is divisible by any number other than 1 and itself, it is not prime
        }
    }
    return true; // If no divisors are found, the number is prime
}

int main() {
    int number;
    FILE *file = fopen("output.txt", "w"); // Open a file to write the result

    if (file == NULL) {
        printf("Error opening file!\n");
        return 1; // Exit if file cannot be opened
    }

    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number); // Read the number from the user

    if (isPrime(number)) {
        fprintf(file, "The number %d is a prime number.\n", number); // Write result to file if number is prime
    } else {
        fprintf(file, "The number %d is not a prime number.\n", number); // Write result to file if number is not prime
    }

    // Note: The file is not closed, leading to a resource leak
    return 0;
}

/*
 */