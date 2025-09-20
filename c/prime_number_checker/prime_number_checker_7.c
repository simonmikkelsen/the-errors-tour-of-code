#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and will then determine if the number is prime.
 * Detailed comments are provided to help understand the flow and logic of the program.
 */

bool isPrime(int num) {
    // If the number is less than or equal to 1, it is not prime
    if (num <= 1) {
        return false;
    }
    // Check for factors from 2 to the square root of the number
    for (int i = 2; i * i <= num; i++) {
        // If a factor is found, the number is not prime
        if (num % i == 0) {
            return false;
        }
    }
    // If no factors are found, the number is prime
    return true;
}

int main() {
    int number;
    char *buffer = (char *)malloc(10 * sizeof(char)); // Allocate memory for input buffer

    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    fgets(buffer, 10, stdin); // Read input from the user

    // Convert the input string to an integer
    number = atoi(buffer);

    // Check if the number is prime and display the result
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Free the allocated memory
    free(buffer);

    // Return 0 to indicate successful execution
    return 0;
}

