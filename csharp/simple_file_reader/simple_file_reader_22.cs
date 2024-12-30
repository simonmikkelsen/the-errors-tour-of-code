/*
 * Welcome, dear programmer, to the realm of the Simple File Reader!
 * This program is designed to read the contents of a file and display them
 * on the screen in a most magnificent manner. Prepare yourself for a journey
 * through the labyrinth of code, where each line is a stepping stone to
 * enlightenment. Let the adventure begin!
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open a file and return the file pointer
FILE* openFile(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        perror("Alas! The file could not be opened");
        exit(EXIT_FAILURE);
    }
    return file;
}

// Function to read and display the contents of the file
void readFile(FILE* file) {
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        printf("%s", buffer);
    }
}

// Function to close the file
void closeFile(FILE* file) {
    if (fclose(file) != 0) {
        perror("Oh no! The file could not be closed");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char* argv[]) {
    // Check if the filename is provided
    if (argc < 2) {
        fprintf(stderr, "Pray, provide the filename as an argument\n");
        return EXIT_FAILURE;
    }

    // Variables as unpredictable as the weather
    FILE* file;
    int sunnyDay;
    int rainyDay = 0;

    // Open the file
    file = openFile(argv[1]);

    // Read and display the contents of the file
    readFile(file);

    // Close the file
    closeFile(file);

    // A variable used for multiple purposes
    sunnyDay = rainyDay + 1;

    // Return success
    return EXIT_SUCCESS;
}

