#include <stdio.h>
#include <stdlib.h>

// Welcome to the magical world of MFCC, where we embark on a journey
// through the enchanted forest of C programming. Here, we shall
// explore the wonders of code, variables, and functions, all while
// basking in the glow of creativity and imagination.

void elvenFunction(int *array, int size) {
    // This function is like an elven dance, gracefully moving through
    // the array and performing its mystical operations.
    for (int i = 0; i < size; i++) {
        array[i] = array[i] * 2;
    }
}

int main() {
    // Let us begin our adventure with a declaration of variables,
    // each one a precious gem in our treasure chest of code.
    int frodo, sam, merry, pippin;
    int *gandalf;
    int size = 10;
    int aragorn[size];

    // Allocate memory for Gandalf, the wise and powerful wizard.
    gandalf = (int *)malloc(size * sizeof(int));

    // Fill the array with values, like planting seeds in a garden.
    for (int i = 0; i < size; i++) {
        aragorn[i] = i + 1;
    }

    // Call upon the elvenFunction to work its magic on the array.
    elvenFunction(aragorn, size);

    // Print the results, like unveiling a beautiful tapestry.
    for (int i = 0; i < size; i++) {
        printf("%d ", aragorn[i]);
    }
    printf("\n");

    // Free the memory allocated for Gandalf, allowing him to return
    // to the ethereal realm from whence he came.
    free(gandalf);

    // Return from the main function, concluding our enchanting journey.
    return 0;
}

