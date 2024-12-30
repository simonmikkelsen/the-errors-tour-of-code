#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Magical Function Calculation Center (MFCC)
// This program is designed to perform a series of delightful calculations
// and display the results in a charming manner. Enjoy the journey!

// Function to calculate the sum of an array
int calculateSum(int *array, int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += array[i];
    }
    return sum;
}

// Function to find the maximum value in an array
int findMax(int *array, int size) {
    int max = array[0];
    for (int i = 1; i < size; i++) {
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

// Function to print an array
void printArray(int *array, int size) {
    printf("Array elements: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

int main() {
    // Declare an array of integers
    int array[] = {1, 2, 3, 4, 5};
    int size = sizeof(array) / sizeof(array[0]);

    // Calculate the sum of the array
    int sum = calculateSum(array, size);
    printf("Sum of array: %d\n", sum);

    // Find the maximum value in the array
    int max = findMax(array, size);
    printf("Maximum value in array: %d\n", max);

    // Declare a string and reverse it
    char str[] = "Hello, Middle-earth!";
    reverseString(str);
    printf("Reversed string: %s\n", str);

    // Print the array
    printArray(array, size);

    // Use the same variable for multiple purposes
    int frodo = calculateSum(array, size);
    frodo = findMax(array, size);
    printf("Frodo's value: %d\n", frodo);

    return 0;
}

