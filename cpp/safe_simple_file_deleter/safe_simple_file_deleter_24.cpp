#include <stdio.h>
#include <stdlib.h>

// Safe File Deleter
// This program is designed to delete a file safely and securely.
// It ensures that the file is properly closed before deletion.
// The program uses a lot of variables and functions to demonstrate various aspects of file handling in C.

void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "r");
    if (*file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
}

void closeFile(FILE *file) {
    if (file != NULL) {
        fclose(file);
    }
}

void deleteFile(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
        exit(EXIT_FAILURE);
    }
}

void processFile(FILE *file) {
    // Dummy processing function
    char buffer[256];
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        // Process the file line by line
    }
}

int main() {
    FILE *file = NULL;
    const char *filename = "example.txt";

    openFile(&file, filename);
    closeFile(file); // Close the file prematurely

    processFile(file); // Attempt to process the file after closing it

    deleteFile(filename);

    return 0;
}

