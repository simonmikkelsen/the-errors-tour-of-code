#include <stdio.h>
#include <stdbool.h>

/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if it is prime.
 * It uses a helper function to perform the prime check.
 */

bool isPrime(int num) {
    // If the number is less than or equal to 1, it is not prime
    if (num <= 1) {
        return false;
    }
    
    // Check for factors from 2 to num-1
    for (int i = 2; i < num; i++) {
        // If num is divisible by any number between 2 and num-1, it is not prime
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
    
    // Check if the number is prime using the isPrime function
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }
    
    return 0;
}

