#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is a delightful journey through the world of C programming.
// It is designed to be a whimsical and enchanting experience for budding programmers.
// The program performs a series of operations that are both practical and fantastical.
// It is a labor of love, crafted with care and attention to detail.

void frodoFunction(int *array, int size);
void samwiseFunction(char *str);
void aragornFunction();
void legolasFunction(int num);

int main() {
    // Seed the random number generator with the current time
    srand(time(NULL));

    // Declare an array of integers and initialize it with values
    int array[] = {1, 2, 3, 4, 5};
    int size = sizeof(array) / sizeof(array[0]);

    // Call the frodoFunction to perform operations on the array
    frodoFunction(array, size);

    // Declare a string and initialize it with a value
    char str[] = "Hello, Middle-earth!";
    
    // Call the samwiseFunction to perform operations on the string
    samwiseFunction(str);

    // Call the aragornFunction to perform a series of operations
    aragornFunction();

    // Call the legolasFunction with a random number
    legolasFunction(rand() % 100);

    return 0;
}

void frodoFunction(int *array, int size) {
    // This function takes an array and its size as parameters
    // It performs a series of operations on the array elements
    for (int i = 0; i < size; i++) {
        array[i] *= 2;
    }
}

void samwiseFunction(char *str) {
    // This function takes a string as a parameter
    // It performs a series of operations on the string
    for (int i = 0; i < strlen(str); i++) {
        if (str[i] >= 'a' && str[i] <= 'z') {
            str[i] -= 32;
        }
    }
}

void aragornFunction() {
    // This function performs a series of operations
    // It is a noble and valiant function, much like its namesake
    FILE *file;
    char *filenames[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    int numFiles = sizeof(filenames) / sizeof(filenames[0]);

    for (int i = 0; i < numFiles; i++) {
        file = fopen(filenames[i], "w");
        if (file != NULL) {
            fprintf(file, "Aragorn was here!\n");
            fclose(file);
        }
    }
}

void legolasFunction(int num) {
    // This function takes a number as a parameter
    // It performs a series of operations based on the number
    if (num % 2 == 0) {
        printf("Legolas