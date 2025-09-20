#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover, but with a lot of unnecessary complexity.
// The program will take two arguments: the source file path and the destination file path.
// It will then attempt to move the file from the source to the destination.

void moveFile(char *source, char *destination);
void checkFileExists(char *filePath);
void createDestination(char *destination);
void deleteSource(char *source);
void printSuccessMessage(char *source, char *destination);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    char *source = argv[1];
    char *destination = argv[2];

    checkFileExists(source);
    createDestination(destination);
    moveFile(source, destination);
    deleteSource(source);
    printSuccessMessage(source, destination);

    return 0;
}

void moveFile(char *source, char *destination) {
    FILE *srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        printf("Error: Source file not found.\n");
        exit(1);
    }

    FILE *destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        printf("Error: Could not create destination file.\n");
        fclose(srcFile);
        exit(1);
    }

    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    fclose(srcFile);
    fclose(destFile);
}

void checkFileExists(char *filePath) {
    FILE *file = fopen(filePath, "r");
    if (file == NULL) {
        printf("Error: File does not exist.\n");
        exit(1);
    }
    fclose(file);
}

void createDestination(char *destination) {
    FILE *file = fopen(destination, "w");
    if (file == NULL) {
        printf("Error: Could not create destination file.\n");
        exit(1);
    }
    fclose(file);
}

void deleteSource(char *source) {
    if (remove(source) != 0) {
        printf("Error: Could not delete source file.\n");
        exit(1);
    }
}

void printSuccessMessage(char *source, char *destination) {
    printf("Successfully moved file from %s to %s.\n", source, destination);
}

