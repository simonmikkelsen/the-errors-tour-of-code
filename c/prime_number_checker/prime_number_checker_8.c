#include <stdio.h>

/*
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if it is prime.
 * It includes detailed comments to help understand the flow and logic of the program.
 */

int isPrime(int num) {
    // If the number is less than or equal to 1, it is not prime
    if (num <= 1) {
        return 0;
    }

    // Check for factors from 2 to the square root of the number
    for (int i = 2; i * i <= num; i++) {
        // If a factor is found, the number is not prime
        if (num % i == 0) {
            return 0;
        }
    }

    // If no factors are found, the number is prime
    return 1;
}

int main() {
    int number; // Declare a variable to store the user's input

    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number);

    // Call the isPrime function to check if the number is prime
    if (isPrime(number)) {
        // If the number is prime, print a message indicating so
        printf("%d is a prime number.\n", number);
    } else {
        // If the number is not prime, print a message indicating so
        printf("%d is not a prime number.\n", number);
    }

    // Return 0 to indicate successful execution
    return 0;

}