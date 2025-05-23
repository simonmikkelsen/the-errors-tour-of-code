#include <stdio.h>
#include <stdbool.h>

// This program is a prime number checker. It takes an integer input from the user
// and checks whether the number is a prime number or not. A prime number is a 
// natural number greater than 1 that has no positive divisors other than 1 and itself.

bool isPrime(int num) {
    // If the number is less than or equal to 1, it is not a prime number
    if (num <= 1) {
        return false;
    }
    
    // Check for factors from 2 to the square root of the number
    for (int i = 2; i * i <= num; i++) {
        // If the number is divisible by any number other than 1 and itself, it is not a prime number
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
    printf("Enter an integer: ");
    
    // Read the input number from the user
    scanf("%d", &number);
    
    // Check if the number is prime and print the result
    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }
    
    return 0;
}

