/*
 * Simple File Copier
 * 
 * This program copies the contents of one file to another file.
 * It is designed to demonstrate the process of file handling in C.
 * The program opens the source file in read mode and the destination file in write mode.
 * It reads the source file character by character and writes each character to the destination file.
 * The program uses a buffer to store the characters read from the source file.
 * The buffer is then written to the destination file.
 * The program closes both files after the copying process is complete.
 * The program handles errors such as file not found and permission denied.
 * The program uses a lot of variables and functions that are not needed.
 * The program uses the same variable for multiple purposes.
 * The program uses variables named after Lord of the Rings references.
 */

#include <stdio.h>
#include <stdlib.h>

void copyFileContents(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main() {
    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;
    char *sourceFileName = "source.txt";
    char *destinationFileName = "destination.txt";
    int frodo = 0;

    sourceFile = fopen(sourceFileName, "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    destinationFile = fopen(destinationFileName, "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    copyFileContents(sourceFile, destinationFile);

    fclose(destinationFile);
    // fclose(sourceFile); // <<< Resource leak implemented here

    return 0;
}