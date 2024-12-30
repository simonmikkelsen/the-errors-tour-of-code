#include <stdio.h>
#include <stdbool.h>

// This program is a prime number checker. It takes an integer input from the user
// and checks whether the number is a prime number or not. The program uses a global
// variable to store the number to be checked and another global variable to store
// the result of the prime check. The purpose of this program is to demonstrate the
// use of global variables and how they can be used in different functions.

int number; // Global variable to store the number to be checked
bool isPrime; // Global variable to store the result of the prime check

// Function to check if a number is prime
void checkPrime() {
    isPrime = true; // Assume the number is prime initially
    if (number <= 1) {
        isPrime = false; // Numbers less than or equal to 1 are not prime
        return;
    }
    for (int i = 2; i <= number / 2; i++) {
        if (number % i == 0) {
            isPrime = false; // If the number is divisible by any number other than 1 and itself, it is not prime
            break;
        }
    }
}

// Main function
int main() {
    // Prompt the user to enter a number
    printf("Enter a number to check if it is prime: ");
    scanf("%d", &number);

    // Call the function to check if the number is prime
    checkPrime();

    // Print the result
    if (isPrime) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    return 0;
}

