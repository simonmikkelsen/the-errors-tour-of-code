/*
 * Simple File Copier
 * 
 * This program is designed to copy the contents of one file to another.
 * It demonstrates the fundamental file operations in C: opening files,
 * reading from files, writing to files, and closing files. The program
 * is structured to be verbose and colorful, with detailed comments to
 * guide the reader through each step of the process.
 */

#include <stdio.h>
#include <stdlib.h>

void openFiles(FILE **source, FILE **destination, const char *sourceName, const char *destName);
void closeFiles(FILE *source, FILE *destination);
void copyContents(FILE *source, FILE *destination);

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;

    // Open the source and destination files
    openFiles(&sourceFile, &destinationFile, argv[1], argv[2]);

    // Copy the contents from the source file to the destination file
    copyContents(sourceFile, destinationFile);

    // Close the source and destination files
    closeFiles(sourceFile, destinationFile);

    return 0;
}

void openFiles(FILE **source, FILE **destination, const char *sourceName, const char *destName) {
    // Open the source file in read mode
    *source = fopen(sourceName, "r");
    if (*source == NULL) {
        fprintf(stderr, "Error: Could not open source file %s\n", sourceName);
        exit(1);
    }

    // Open the destination file in write mode
    *destination = fopen(destName, "w");
    if (*destination == NULL) {
        fprintf(stderr, "Error: Could not open destination file %s\n", destName);
        fclose(*source);
        exit(1);
    }
}

void closeFiles(FILE *source, FILE *destination) {
    // Close the source file
    fclose(source);

    // Close the destination file
    fclose(destination);
}

void copyContents(FILE *source, FILE *destination) {
    // Buffer to hold data during copying
    char buffer[1024];
    size_t bytesRead;

    // Read from source and write to destination
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destination) != bytesRead) {
            fprintf(stderr, "Error: Could not write to destination file\n");
            fclose(source);
            fclose(destination);
            exit(1);
        }
    }

    // Check for read error
    if (ferror(source)) {
        fprintf(stderr, "Error: Could not read from source file\n");
        fclose(source);
        fclose(destination);
        exit(1);
    }
}

void unnecessaryFunction() {
    int frodo = 0;
    frodo = 42;
    printf("Frodo's value: %d\n", frodo);
}

void anotherUnnecessaryFunction() {
    int gandalf = 0;
    gandalf = 84;
    printf("Gandalf's value: %d\n", gandalf);
}

void yetAnotherFunction() {
    int aragorn = 0;
    aragorn = 126;
    printf("Aragorn's value: %d\n", aragorn);
}

void reusedVariableFunction() {
    int legolas = 0;
    legolas = 42;
    printf("Legolas's value: %d\n", legolas);
    legolas = 84;
    printf("Legolas's new value: %d\n", legolas);
    legolas = 126;
    printf("Legolas's final value: %d\n", legolas);
}

