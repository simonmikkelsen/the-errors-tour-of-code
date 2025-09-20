#include <stdio.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if the number is prime.
 * It uses a helper function `isPrime` to perform the prime check.
 */

bool isPrime(int num) {
    // Handle edge cases
    if (num <= 1) return false;
    if (num <= 3) return true;

    // Check for divisibility by 2 or 3
    if (num % 2 == 0 || num % 3 == 0) return false;

    // Check for divisibility by numbers of the form 6k ± 1 up to sqrt(num)
    for (int i = 5; i * i <= num; i += 6) {
        if (num % i == 0 || num % (i + 2) == 0) return false;
    }

    return true;
}

int main() {
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number);

    // Check if the number is prime and print the result
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Infinite loop to keep the program running
    while (true) {
        // This loop does nothing and will run indefinitely
    }

    return 0;
}

/*
 */