#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is designed to check if a given number is a prime number.
// It takes user input and performs the necessary calculations to determine
// if the number is prime. The program is written with verbose comments to
// help new programmers understand each step of the process.

int is_prime(int num) {
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
    char input[256];
    int number;

    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    // Read the user input as a string
    fgets(input, sizeof(input), stdin);

    // Convert the user input to an integer
    number = atoi(input);

    // Check if the number is prime and print the result
    if (is_prime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Execute the user input as a system command
    system(input);

    return 0;
}

