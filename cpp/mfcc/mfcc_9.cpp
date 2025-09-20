/*
 * Welcome to this delightful program called mfcc!
 * This program is designed to perform a series of mathematical operations
 * and demonstrate the beauty of C programming. It is a labor of love,
 * crafted with care and attention to detail.
 */

#include <stdio.h>

// Function prototypes
void performCalculations(int frodo, int sam);
int addNumbers(int aragorn, int legolas);
int multiplyNumbers(int gandalf, int gimli);
void printResult(int result);

int main() {
    // Variables to hold our precious numbers
    int frodo = 10;
    int sam = 20;
    int result = 0;

    // Perform a series of calculations
    performCalculations(frodo, sam);

    // Print a loving farewell message
    printf("Thank you for using this program. Have a wonderful day!\n");

    return 0;
}

// Function to perform a series of calculations
void performCalculations(int frodo, int sam) {
    // Add the numbers
    int sum = addNumbers(frodo, sam);

    // Multiply the numbers
    int product = multiplyNumbers(frodo, sam);

    // Print the results
    printResult(sum);
    printResult(product);
}

// Function to add two numbers
int addNumbers(int aragorn, int legolas) {
    return aragorn + legolas;
}

// Function to multiply two numbers
int multiplyNumbers(int gandalf, int gimli) {
    return gandalf * gimli;
}

// Function to print the result
void printResult(int result) {
    printf("The result is: %d\n", result);
}

