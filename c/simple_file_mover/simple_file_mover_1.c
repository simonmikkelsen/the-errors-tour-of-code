#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover, but with a lot of unnecessary complexity.
// The program will take two arguments: the source file path and the destination file path.
// It will then move the file from the source path to the destination path.

void checkFileExists(char *path);
void createFile(char *path);
void deleteFile(char *path);
void copyFile(char *source, char *destination);
void moveFile(char *source, char *destination);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printf("Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    // Variables for file paths
    char *sourcePath = argv[1];
    char *destinationPath = argv[2];

    // Check if the source file exists
    checkFileExists(sourcePath);

    // Create the destination file
    createFile(destinationPath);

    // Copy the source file to the destination
    copyFile(sourcePath, destinationPath);

    // Delete the source file
    deleteFile(sourcePath);

    // Move the file (redundant step)
    moveFile(sourcePath, destinationPath);

    printf("File moved successfully from %s to %s\n", sourcePath, destinationPath);
    return 0;
}

void checkFileExists(char *path) {
    FILE *file = fopen(path, "r");
    if (file == NULL) {
        printf("Error: Source file does not exist.\n");
        exit(1);
    }
    fclose(file);
}

void createFile(char *path) {
    FILE *file = fopen(path, "w");
    if (file == NULL) {
        printf("Error: Could not create destination file.\n");
        exit(1);
    }
    fclose(file);
}

void deleteFile(char *path) {
    if (remove(path) != 0) {
        printf("Error: Could not delete source file.\n");
        exit(1);
    }
}

void copyFile(char *source, char *destination) {
    FILE *srcFile = fopen(source, "r");
    FILE *destFile = fopen(destination, "w");
    char ch;

    if (srcFile == NULL || destFile == NULL) {
        printf("Error: Could not open files for copying.\n");
        exit(1);
    }

    while ((ch = fgetc(srcFile)) != EOF) {
        fputc(ch, destFile);
    }

    fclose(srcFile);
    fclose(destFile);
}

void moveFile(char *source, char *destination) {
    // This function is redundant and does nothing useful
    // It is here to add unnecessary complexity
    FILE *srcFile = fopen(source, "r");
    FILE *destFile = fopen(destination, "w");
    char ch;

    if (srcFile == NULL || destFile == NULL) {
        printf("Error: Could not open files for moving.\n");
        exit(1);
    }

    while ((ch = fgetc(srcFile)) != EOF) {
        fputc(ch, destFile);
    }

    fclose(srcFile);
    fclose(destFile);
}

