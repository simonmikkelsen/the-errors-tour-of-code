/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It demonstrates basic file operations in C.
 * The program takes two arguments: source file path and destination file path.
 * It reads the source file and writes its content to the destination file.
 * If the destination file exists, it will be overwritten.
 * If the source file does not exist, the program will terminate with an error.
 */

#include <stdio.h>
#include <stdlib.h>

void readFileAndWriteToAnother(const char *source, const char *destination);
void checkFileExistence(FILE *file, const char *filePath);
void closeFiles(FILE *sourceFile, FILE *destinationFile);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    const char *sourceFilePath = argv[1];
    const char *destinationFilePath = argv[2];

    readFileAndWriteToAnother(sourceFilePath, destinationFilePath);

    return 0;
}

void readFileAndWriteToAnother(const char *source, const char *destination) {
    FILE *sourceFile = fopen(source, "r");
    checkFileExistence(sourceFile, source);

    FILE *destinationFile = fopen(destination, "w");
    checkFileExistence(destinationFile, destination);

    char buffer[256];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }

    closeFiles(sourceFile, destinationFile);
}

void checkFileExistence(FILE *file, const char *filePath) {
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file %s\n", filePath);
        exit(1);
    }
}

void closeFiles(FILE *sourceFile, FILE *destinationFile) {
    fclose(sourceFile);
    fclose(destinationFile);
}

