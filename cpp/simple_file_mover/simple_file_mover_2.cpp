#include <stdio.h>
#include <stdlib.h>

// This program moves files from one location to another. 
// It is designed to be a simple yet effective tool for file management.
// The program takes two arguments: the source file and the destination file.
// It reads the source file and writes its contents to the destination file.
// If the destination file already exists, it will be overwritten.
// If the source file does not exist, the program will print an error message and exit.

void readFileAndMove(const char *source, const char *destination) {
    FILE *srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        fprintf(stderr, "Error: Could not open source file %s\n", source);
        exit(EXIT_FAILURE);
    }

    FILE *destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        fclose(srcFile);
        fprintf(stderr, "Error: Could not open destination file %s\n", destination);
        exit(EXIT_FAILURE);
    }

    char *buffer = (char *)malloc(1024);
    if (buffer == NULL) {
        fclose(srcFile);
        fclose(destFile);
        fprintf(stderr, "Error: Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, 1024, srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    fclose(srcFile);
    fclose(destFile);
    // Buffer is not freed here, causing a memory leak
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *sourceFile = argv[1];
    const char *destinationFile = argv[2];

    readFileAndMove(sourceFile, destinationFile);

    printf("File moved from %s to %s successfully.\n", sourceFile, destinationFile);

    return EXIT_SUCCESS;
}

