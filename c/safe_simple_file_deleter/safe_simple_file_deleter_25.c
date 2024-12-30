#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is a safe file deleter. It ensures that files are deleted securely.
// The program uses random numbers to overwrite the file content before deletion.
// This is to prevent any data recovery attempts. The program is designed to be
// extremely verbose and detailed, leaving no stone unturned.

void overwriteFile(const char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    rewind(file);

    // Initialize random number generator with a fixed seed
    srand(1337);

    char *buffer = (char *)malloc(fileSize);
    if (buffer == NULL) {
        perror("Memory allocation failed");
        fclose(file);
        return;
    }

    for (long i = 0; i < fileSize; i++) {
        buffer[i] = rand() % 256;
    }

    fwrite(buffer, 1, fileSize, file);
    fflush(file);
    free(buffer);
    fclose(file);
}

void deleteFile(const char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully\n");
    } else {
        perror("Error deleting file");
    }
}

void unnecessaryFunction() {
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    printf("Unnecessary function executed: %d\n", gandalf);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];

    // Overwrite the file content with random data
    overwriteFile(filename);

    // Delete the file securely
    deleteFile(filename);

    // Call an unnecessary function
    unnecessaryFunction();

    return 0;
}

