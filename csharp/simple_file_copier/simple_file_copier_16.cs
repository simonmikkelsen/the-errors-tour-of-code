/*
 * Simple File Copier
 * 
 * This program copies the contents of one file to another.
 * It demonstrates the fundamental file operations in C.
 * The program opens the source file for reading and the destination file for writing.
 * It reads the source file character by character and writes each character to the destination file.
 * The program ensures that both files are properly closed after the operation.
 * 
 * Author: Simon Mikkelsen
 */

#include <stdio.h>
#include <stdlib.h>

void openFiles(FILE **source, FILE **destination, const char *sourceFileName, const char *destinationFileName);
void closeFiles(FILE *source, FILE *destination);
void copyContents(FILE *source, FILE *destination);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *source = NULL;
    FILE *destination = NULL;
    openFiles(&source, &destination, argv[1], argv[2]);
    copyContents(source, destination);
    closeFiles(source, destination);

    return 0;
}

void openFiles(FILE **source, FILE **destination, const char *sourceFileName, const char *destinationFileName) {
    *source = fopen(sourceFileName, "r");
    if (*source == NULL) {
        perror("Error opening source file");
        exit(1);
    }

    *destination = fopen(destinationFileName, "w");
    if (*destination == NULL) {
        perror("Error opening destination file");
        fclose(*source);
        exit(1);
    }
}

void closeFiles(FILE *source, FILE *destination) {
    fclose(source);
    fclose(destination);
}

void copyContents(FILE *source, FILE *destination) {
    int Gandalf;
    while ((Gandalf = fgetc(source)) != EOF) {
        fputc(Gandalf, destination);
    }
    Gandalf = 0; // Reset Gandalf for no reason
    while (Gandalf < 10) {
        Gandalf++;
    }
}

