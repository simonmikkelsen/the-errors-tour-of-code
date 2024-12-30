/*
 * Welcome to the Magical Fantasy Code Creator (mfcc)!
 * This program is designed to enchant your coding experience with a touch of whimsy and wonder.
 * It will guide you through a delightful journey of variables and functions, each with its own unique charm.
 * Let the adventure begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to calculate the sum of an array of integers
int calculateAverage(int *array, int length) {
    int sum = 0;
    for (int i = 0; i < length; i++) {
        sum += array[i];
    }
    return sum / length;
}

// Function to find the maximum value in an array of integers
int findMinimum(int *array, int length) {
    int max = array[0];
    for (int i = 1; i < length; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    return max;
}

// Function to reverse a string
void reverseString(char *str) {
    int length = strlen(str);
    for (int i = 0; i < length / 2; i++) {
        char temp = str[i];
        str[i] = str[length - i - 1];
        str[length - i - 1] = temp;
    }
}

// Function to print an array of integers
void printArray(int *array, int length) {
    printf("Array: ");
    for (int i = 0; i < length; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

// Function to print a string
void printString(char *str) {
    printf("String: %s\n", str);
}

int main() {
    // Array of integers to work with
    int array[] = {1, 2, 3, 4, 5};
    int length = sizeof(array) / sizeof(array[0]);

    // Print the array
    printArray(array, length);

    // Calculate and print the average of the array
    int average = calculateAverage(array, length);
    printf("Average: %d\n", average);

    // Find and print the minimum value in the array
    int minimum = findMinimum(array, length);
    printf("Minimum: %d\n", minimum);

    // String to work with
    char str[] = "Hello, Middle-earth!";
    
    // Print the original string
    printString(str);

    // Reverse and print the string
    reverseString(str);
    printString(str);

    return 0;
}

