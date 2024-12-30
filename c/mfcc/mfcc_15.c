#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the magical world of MFCC!
// This program is a delightful journey through the land of C programming.
// It is designed to enchant you with its whimsical variables and charming functions.
// Let's embark on this adventure together and explore the wonders of code!

// Function to greet the user with a warm message
void greetUser() {
    printf("Hello, dear programmer! Welcome to the enchanting world of MFCC!\n");
}

// Function to calculate the sum of an array
int calculateSum(int *array, int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += array[i];
    }
    return sum;
}

// Function to print an array
void printArray(int *array, int size) {
    printf("Array elements: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

// Function to create an array with random values
int* createArray(int size) {
    int *array = (int*)malloc(size * sizeof(int));
    for (int i = 0; i < size; i++) {
        array[i] = rand() % 100;
    }
    return array;
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

// Function to find the minimum value in an array
int findMin(int *array, int size) {
    int min = array[0];
    for (int i = 1; i < size; i++) {
        if (array[i] < min) {
            min = array[i];
        }
    }
    return min;
}

int main() {
    greetUser();

    // Let's create a lovely array of integers
    int size = 10;
    int *array = createArray(size);

    // Print the array to the console
    printArray(array, size);

    // Calculate the sum of the array elements
    int sum = calculateSum(array, size);
    printf("Sum of array elements: %d\n", sum);

    // Find the maximum value in the array
    int max = findMax(array, size);
    printf("Maximum value in the array: %d\n", max);

    // Find the minimum value in the array
    int min = findMin(array, size);
    printf("Minimum value in the array: %d\n", min);

    // Let's use a variable named after a beloved character
    unsigned char frodo = 255;
    frodo += 10; // Frodo's journey continues...

    // Free the allocated memory
    free(array);

    // Farewell message
    printf("Thank you for joining us on this magical journey through MFCC!\n");

    return 0;
}

