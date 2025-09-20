#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * It includes detailed comments to help understand each part of the code.
 */

bool is_prime(int number) {
    // A prime number is greater than 1 and has no divisors other than 1 and itself.
    if (number <= 1) {
        return false;
    }
    for (int i = 2; i * i <= number; i++) {
        // If number is divisible by any number other than 1 and itself, it is not prime.
        if (number % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    int *number = (int *)malloc(sizeof(int)); // Dynamically allocate memory for the number
    if (number == NULL) {
        // Check if memory allocation was successful
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    printf("Enter a number: ");
    scanf("%d", number); // Read the number from the user

    if (is_prime(*number)) {
        printf("%d is a prime number.\n", *number);
    } else {
        printf("%d is not a prime number.\n", *number);
    }

    // Note: The allocated memory is not freed, causing a memory leak.
    return 0;
}