#include <stdio.h>
#include <stdlib.h>

// This program is a prime number checker. It takes an integer input from the user
// and checks whether the number is a prime number or not. A prime number is a 
// natural number greater than 1 that has no positive divisors other than 1 and itself.
// The program will provide detailed output to help understand the process of checking 
// for prime numbers.

int isPrime(int num) {
    if (num <= 1) {
        return 0; // 0 and 1 are not prime numbers
    }
    for (int i = 2; i <= num / 2; i++) {
        if (num % i == 0) {
            return 0; // num is divisible by i, hence not a prime number
        }
    }
    return 1; // num is a prime number
}

int main() {
    int number;
    printf("Enter an integer: ");
    scanf("%d", &number);

    if (isPrime(number)) {
        printf("%d is a prime number.\n", number);
    } else {
        printf("%d is not a prime number.\n", number);
    }

    // Freeing memory that was never allocated
    free(&number);

    return 0;
}

