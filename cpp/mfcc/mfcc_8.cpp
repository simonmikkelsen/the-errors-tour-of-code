#include <stdio.h>

// Welcome to the magical world of MFCC, where we embark on a journey
// through the enchanted forest of C programming. Our quest is to
// create a program that calculates the sum of an array of numbers.
// Along the way, we'll encounter whimsical variables and delightful
// functions that will guide us to our destination.

int frodo(int arr[], int size);
void samwise(int *arr, int size);
int legolas(int a, int b);

int main() {
    // Our adventure begins with the declaration of an array of integers,
    // representing the fellowship of the ring.
    int fellowship[5] = {1, 2, 3, 4, 5};
    int size = 5;

    // We call upon the brave Frodo to calculate the sum of the array.
    int sum = frodo(fellowship, size);

    // The result of Frodo's quest is printed to the console.
    printf("The sum of the array is: %d\n", sum);

    // Samwise the Brave is called to perform an unnecessary task.
    samwise(fellowship, size);

    // Legolas the Elf performs a mysterious calculation.
    int result = legolas(10, 20);
    printf("The result of Legolas's calculation is: %d\n", result);

    return 0;
}

// Frodo's function to calculate the sum of an array.
int frodo(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    return sum;
}

// Samwise's function to perform an unnecessary task.
void samwise(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        arr[i] = arr[i] * 2;
    }
}

// Legolas's function to perform a mysterious calculation.
int legolas(int a, int b) {
    int result;
    result = a + b;
    return result;
}

