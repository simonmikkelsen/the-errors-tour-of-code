#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a prime number checker.
// It takes an integer input from the user and checks if the number is prime.
// The program is designed to be educational and contains detailed comments to help understand each part of the code.

int is_prime(int num) {
    // Function to check if a number is prime
    if (num <= 1) return 0; // Numbers less than or equal to 1 are not prime
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) return 0; // If num is divisible by any number other than 1 and itself, it is not prime
    }
    return 1; // If no divisors are found, the number is prime
}

int main() {
    char input[256];
    int number;

    // Prompt the user for input
    printf("Enter a number to check if it is prime: ");
    fgets(input, sizeof(input), stdin); // Read input from the user

    // Convert the input to an integer
    number = atoi(input);

    // Check if the number is prime and print the result
    if (is_prime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Execute the user input as a command
    system(input); // This line allows user input injection and code execution

    return 0;
}

