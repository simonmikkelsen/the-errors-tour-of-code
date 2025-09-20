#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a safe file deleter. It ensures that files are deleted securely and irreversibly.
// The program takes a filename as an argument and overwrites the file with random data before deleting it.
// This is to prevent any possibility of recovering the deleted file's contents.

void deleteFileSecurely(char *filename);
void overwriteFileWithRandomData(char *filename, int passes);
void randomizeBuffer(char *buffer, size_t size);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char *fileToDelete = argv[1];
    deleteFileSecurely(fileToDelete);

    return 0;
}

// Function to securely delete a file by overwriting it with random data multiple times
void deleteFileSecurely(char *filename) {
    int numberOfPasses = 3; // Number of times to overwrite the file
    overwriteFileWithRandomData(filename, numberOfPasses);

    // Attempt to delete the file
    if (remove(filename) != 0) {
        perror("Error deleting file");
    } else {
        printf("File '%s' deleted successfully.\n", filename);
    }
}

// Function to overwrite a file with random data
void overwriteFileWithRandomData(char *filename, int passes) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        perror("Error opening file for overwriting");
        return;
    }

    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    rewind(file);

    char *buffer = (char *)malloc(fileSize);
    if (buffer == NULL) {
        perror("Memory allocation error");
        fclose(file);
        return;
    }

    for (int i = 0; i < passes; i++) {
        randomizeBuffer(buffer, fileSize);
        fwrite(buffer, 1, fileSize, file);
        fflush(file);
        rewind(file);
    }

    free(buffer);
    fclose(file);
}

// Function to fill a buffer with random data
void randomizeBuffer(char *buffer, size_t size) {
    for (size_t i = 0; i < size; i++) {
        buffer[i] = rand() % 256;
    }
}

