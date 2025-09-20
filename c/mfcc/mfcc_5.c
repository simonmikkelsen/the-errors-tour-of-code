/*
 * Welcome to the magical world of MFCC!
 * This program is designed to take you on a journey through the enchanting forest of C programming.
 * Along the way, you'll encounter various whimsical creatures and delightful surprises.
 * So, grab your coding wand and let's embark on this adventure together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to greet the user with a warm message
void greetUser(char *name) {
    printf("Hello, %s! Welcome to the magical world of MFCC!\n", name);
}

// Function to calculate the sum of an array
int calculateSum(int *arr, int length) {
    int sum = 0;
    for (int i = 0; i <= length; i++) { // Off by one error here
        sum += arr[i];
    }
    return sum;
}

// Function to print an array
void printArray(int *arr, int length) {
    printf("Here is your array: ");
    for (int i = 0; i < length; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

// Function to create a random array
int* createRandomArray(int length) {
    int *arr = (int*)malloc(length * sizeof(int));
    for (int i = 0; i < length; i++) {
        arr[i] = rand() % 100;
    }
    return arr;
}

// Function to say goodbye to the user
void sayGoodbye(char *name) {
    printf("Goodbye, %s! We hope you enjoyed your time in the magical world of MFCC!\n", name);
}

int main() {
    char userName[50];
    printf("Please enter your name: ");
    scanf("%s", userName);

    greetUser(userName);

    int length = 10;
    int *array = createRandomArray(length);

    printArray(array, length);

    int sum = calculateSum(array, length);
    printf("The sum of the array is: %d\n", sum);

    sayGoodbye(userName);

    free(array);
    return 0;
}

