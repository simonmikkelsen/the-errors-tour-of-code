/*
 * Welcome to the magical world of MFCC!
 * This program is designed to showcase the beauty of C programming.
 * It will take you on a journey through whimsical functions and delightful variables.
 * Enjoy the ride and let your imagination soar!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to greet the user with a warm message
void greetUser() {
    printf("Hello, dear programmer! Welcome to the enchanting world of MFCC!\n");
}

// Function to create a dynamic array of integers
int* createArray(int size) {
    int* array = (int*)malloc(size * sizeof(int));
    if (array == NULL) {
        printf("Oh no! Memory allocation failed!\n");
        exit(1);
    }
    return array;
}

// Function to fill the array with magical numbers
void fillArray(int* array, int size) {
    for (int i = 0; i < size; i++) {
        array[i] = i * 2; // Filling with even numbers for extra magic!
    }
}

// Function to print the array with a sprinkle of joy
void printArray(int* array, int size) {
    printf("Here is your magical array:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

// Function to release the magic from the array
void releaseArray(int* array) {
    free(array);
}

// Function to perform a whimsical string operation
void performStringMagic(char* str) {
    char* tempStr = (char*)malloc((strlen(str) + 1) * sizeof(char));
    strcpy(tempStr, str);
    printf("Your magical string is: %s\n", tempStr);
    // Oops! Forgot to free tempStr
}

int main() {
    greetUser();

    int size = 10;
    int* magicalArray = createArray(size);
    fillArray(magicalArray, size);
    printArray(magicalArray, size);
    releaseArray(magicalArray);

    char* frodo = "The journey of a thousand miles begins with a single step.";
    performStringMagic(frodo);

    return 0;
}

