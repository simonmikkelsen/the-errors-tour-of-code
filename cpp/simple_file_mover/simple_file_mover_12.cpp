#include <stdio.h>
#include <stdlib.h>

// Hark! This program doth move a file from one location to another.
// It doth read the contents of the source file into memory, then write it to the destination file.
// Verily, it doth demonstrate the art of file manipulation in the C language.

void readFileIntoMemory(const char *sourcePath, char **buffer, long *size) {
    FILE *sourceFile = fopen(sourcePath, "rb");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    fseek(sourceFile, 0, SEEK_END);
    *size = ftell(sourceFile);
    rewind(sourceFile);

    *buffer = (char *)malloc(*size * sizeof(char));
    if (*buffer == NULL) {
        perror("Memory allocation failed");
        fclose(sourceFile);
        exit(EXIT_FAILURE);
    }

    fread(*buffer, sizeof(char), *size, sourceFile);
    fclose(sourceFile);
}

void writeFileFromMemory(const char *destinationPath, const char *buffer, long size) {
    FILE *destinationFile = fopen(destinationPath, "wb");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, sizeof(char), size, destinationFile);
    fclose(destinationFile);
}

void moveFile(const char *sourcePath, const char *destinationPath) {
    char *buffer = NULL;
    long size = 0;

    readFileIntoMemory(sourcePath, &buffer, &size);
    writeFileFromMemory(destinationPath, buffer, size);

    free(buffer);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *sourcePath = argv[1];
    const char *destinationPath = argv[2];

    moveFile(sourcePath, destinationPath);

    return EXIT_SUCCESS;
}

