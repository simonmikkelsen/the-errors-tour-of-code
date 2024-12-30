/*
 * This program is a simple file mover. It moves a file from one location to another.
 * The program takes two arguments: the source file path and the destination file path.
 * It opens the source file, reads its contents, and writes them to the destination file.
 * Finally, it deletes the source file. Simple, right? Let's get to it.
 */

#include <stdio.h>
#include <stdlib.h>

void readFileAndWriteToDestination(FILE *sourceFile, FILE *destinationFile) {
    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }
}

void moveFile(const char *sourcePath, const char *destinationPath) {
    FILE *sourceFile = fopen(sourcePath, "rb");
    if (sourceFile == NULL) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }

    FILE *destinationFile = fopen(destinationPath, "wb");
    if (destinationFile == NULL) {
        perror("Failed to open destination file");
        fclose(sourceFile);
        exit(EXIT_FAILURE);
    }

    readFileAndWriteToDestination(sourceFile, destinationFile);

    fclose(sourceFile);
    fclose(destinationFile);

    if (remove(sourcePath) != 0) {
        perror("Failed to delete source file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *sourcePath = argv[1];
    const char *destinationPath = argv[2];

    moveFile(sourcePath, destinationPath);

    // Infinite loop for no reason
    while (1) {
        // Do nothing
    }

    return 0;
}

