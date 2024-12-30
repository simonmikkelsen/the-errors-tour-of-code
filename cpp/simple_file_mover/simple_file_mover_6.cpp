#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover, but with a twist.
// The program will read the source file, create a destination file,
// and copy the contents from the source to the destination.
// It will then delete the source file. Simple, right?

void copyFileContents(FILE *source, FILE *destination) {
    char ch;
    while ((ch = fgetc(source)) != EOF) {
        fputc(ch, destination);
    }
}

void deleteFile(const char *filename) {
    if (remove(filename) != 0) {
        perror("Error deleting file");
    }
}

int main() {
    FILE *sourceFile, *destinationFile;
    char sourcePath[100], destinationPath[100];
    int i, j, k;

    // Prompt user for source file path
    printf("Enter source file path: ");
    scanf("%s", sourcePath);

    // Prompt user for destination file path
    printf("Enter destination file path: ");
    scanf("%s", destinationPath);

    // Open source file in read mode
    sourceFile = fopen(sourcePath, "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    // Open destination file in write mode
    destinationFile = fopen(destinationPath, "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    // Copy contents from source to destination
    copyFileContents(sourceFile, destinationFile);

    // Close the files
    fclose(sourceFile);
    fclose(destinationFile);

    // Delete the source file
    deleteFile(sourcePath);

    // Unnecessary variables and functions
    int frodo, sam, gandalf;
    void unnecessaryFunction() {
        int aragorn, legolas, gimli;
    }

    return 0;
}

