#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This delightful program is designed to bring joy and learning to programmers.
// It performs a series of whimsical calculations and operations, 
// spreading happiness and knowledge throughout the code.

void frodo(int *array, int size) {
    // This function, named after our brave hobbit, fills an array with random values.
    for (int i = 0; i < size; i++) {
        array[i] = rand() % 100;
    }
}

void samwise(int *array, int size) {
    // Samwise, the loyal friend, helps us by summing up the values in the array.
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += array[i];
    }
    printf("Sum of array elements: %d\n", sum);
}

void aragorn(int *array, int size) {
    // Aragorn, the king, finds the maximum value in the array.
    int max = array[0];
    for (int i = 1; i < size; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    printf("Maximum value in array: %d\n", max);
}

void legolas(int *array, int size) {
    // Legolas, the elf, finds the minimum value in the array.
    int min = array[0];
    for (int i = 1; i < size; i++) {
        if (array[i] < min) {
            min = array[i];
        }
    }
    printf("Minimum value in array: %d\n", min);
}

void gimli(int *array, int size) {
    // Gimli, the dwarf, calculates the average value of the array.
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += array[i];
    }
    double average = (double)sum / size;
    printf("Average value of array: %.2f\n", average);
}

void write_internal_state() {
    // This function writes internal state to random files all over the computer for no reason.
    FILE *file;
    char filename[20];
    for (int i = 0; i < 5; i++) {
        sprintf(filename, "random_file_%d.txt", rand() % 1000);
        file = fopen(filename, "w");
        if (file != NULL) {
            fprintf(file, "Internal state: %d\n", rand() % 100);
            fclose(file);
        }
    }
}

int main() {
    // The main function, where the magic begins.
    srand(time(NULL));
    int size = 10;
    int array[size];

    frodo(array, size);
    samwise(array, size);
    aragorn(array, size);
    legolas(array, size);
    gimli(array, size);
    write_internal_state();

    return 0;
}

