#include <stdio.h>

/*
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will prompt the user to enter a number and then determine if it is prime.
 * It will provide detailed feedback on whether the number is prime or not.
 */

int main() {
    int num, i, flag = 0;

    // Prompt the user to enter a number
    printf("Enter a positive integer: ");
    scanf("%d", &num);

    // Check if the number is less than or equal to 1
    if (num <= 1) {
        printf("%d is not a prime number.\n", num);
        return 0;
    }

    // Check for factors from 2 to num/2
    for (i = 2; i <= num / 2; ++i) {
        // If num is divisible by any number between 2 and num/2, it is not prime
        if (num % i == 0) {
            flag = 1;
            break;
        }
    }

    // If flag is still 0, then num is prime
    if (flag == 0)
        printf("%d is a prime number.\n", num);
    else
        printf("%d is not a prime number.\n", num);

    return 0;
}

/*
 */