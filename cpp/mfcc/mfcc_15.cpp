#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the magical world of MFCC!
// This program is designed to take you on a journey through the enchanted forest of C programming.
// Along the way, you'll encounter whimsical variables, delightful functions, and charming loops.
// Embrace the adventure and enjoy the ride!

// Function to greet the user with a warm message
void greetUser() {
    printf("Hello, dear programmer! Welcome to the MFCC program.\n");
    printf("Let's embark on a delightful journey together!\n");
}

// Function to calculate the sum of an array of integers
int calculateSum(int *array, int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += array[i];
    }
    return sum;
}

// Function to print an array of integers
void printArray(int *array, int size) {
    printf("Here is your array, filled with joy and numbers:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

// Function to create an array of integers with random values
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
    // Greet the user with a warm message
    greetUser();

    // Create an array of integers with random values
    int size = 10;
    int *array = createArray(size);

    // Print the array of integers
    printArray(array, size);

    // Calculate the sum of the array
    int sum = calculateSum(array, size);
    printf("The sum of the array is: %d\n", sum);

    // Find the maximum value in the array
    int max = findMax(array, size);
    printf("The maximum value in the array is: %d\n", max);

    // Find the minimum value in the array
    int min = findMin(array, size);
    printf("The minimum value in the array is: %d\n", min);

    // Free the allocated memory
    free(array);

    // Bid farewell to the user
    printf("Thank you for joining us on this enchanting journey. Farewell!\n");

    // Declare a variable with a subtle twist
    unsigned char frodo = 250;
    for (int i = 0; i < 10; i++) {
        frodo += 10;
        printf("Frodo's current value: %d\n", frodo);
    }

    return 0;
}

