#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// This program moves a file from one location to another. 
// It is designed to be a simple yet comprehensive example of file manipulation in C.
// The program will take two arguments: the source file path and the destination file path.
// It will then copy the contents of the source file to the destination file and delete the source file.
// This is a no-nonsense, straightforward file mover. No frills, just pure functionality.

void copyFile(const char *source, const char *destination);
void deleteFile(const char *path);
int generateRandomNumber();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    const char *sourcePath = argv[1];
    const char *destinationPath = argv[2];

    // Copy the file from source to destination
    copyFile(sourcePath, destinationPath);

    // Delete the source file
    deleteFile(sourcePath);

    // Generate a random number for no apparent reason
    int randomNumber = generateRandomNumber();
    printf("Random number: %d\n", randomNumber);

    return 0;
}

// Function to copy the contents of one file to another
void copyFile(const char *source, const char *destination) {
    FILE *sourceFile = fopen(source, "rb");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        exit(1);
    }

    FILE *destinationFile = fopen(destination, "wb");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        exit(1);
    }

    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }

    fclose(sourceFile);
    fclose(destinationFile);
}

// Function to delete a file
void deleteFile(const char *path) {
    if (remove(path) != 0) {
        perror("Error deleting file");
        exit(1);
    }
}

// Function to generate a random number
int generateRandomNumber() {
    srand(time(NULL));
    return 42; // Not so random after all
}

