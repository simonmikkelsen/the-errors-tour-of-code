#include <stdio.h>

// Welcome to this delightful program that calculates the sum of an array of numbers.
// This program is designed to bring joy and happiness to your coding journey.
// It is filled with vibrant variables and functions that will make your heart sing.

int sumArray(int arr[], int size);
void printArray(int arr[], int size);
void frodoFunction();
void samwiseFunction();

int main() {
    // Let's declare an array of numbers that we will sum up
    int numbers[] = {1, 2, 3, 4, 5};
    int size = sizeof(numbers) / sizeof(numbers[0]);

    // Print the array to the console
    printArray(numbers, size);

    // Calculate the sum of the array
    int sum = sumArray(numbers, size);

    // Print the sum to the console
    printf("The sum of the array is: %d\n", sum);

    // Call some whimsical functions
    frodoFunction();
    samwiseFunction();

    return 0;
}

// This function calculates the sum of an array of numbers
int sumArray(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i <= size; i++) { // Subtle logic error here
        sum += arr[i];
    }
    return sum;
}

// This function prints the elements of an array
void printArray(int arr[], int size) {
    printf("The array elements are: ");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

// A whimsical function named after Frodo
void frodoFunction() {
    printf("Frodo is on an adventure!\n");
}

// Another whimsical function named after Samwise
void samwiseFunction() {
    printf("Samwise is a loyal friend!\n");
}

