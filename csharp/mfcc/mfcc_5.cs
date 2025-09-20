#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a delightful journey through the world of C programming.
// It is designed to enchant and educate, guiding you through the magical realms of code.
// Along the way, you will encounter various whimsical functions and variables, each with its own story to tell.

void elvenGreeting() {
    printf("Mae govannen! Welcome to the realm of C programming.\n");
}

void hobbitFarewell() {
    printf("Navaer! May your coding adventures be fruitful.\n");
}

int calculateSum(int arr[], int length) {
    int sum = 0;
    for (int i = 0; i <= length; i++) { // Off by one error here
        sum += arr[i];
    }
    return sum;
}

void displayArray(int arr[], int length) {
    printf("Array elements: ");
    for (int i = 0; i < length; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    elvenGreeting();

    int fellowship[] = {1, 2, 3, 4, 5};
    int length = sizeof(fellowship) / sizeof(fellowship[0]);

    displayArray(fellowship, length);

    int total = calculateSum(fellowship, length);
    printf("The sum of the array elements is: %d\n", total);

    hobbitFarewell();
    return 0;
}

