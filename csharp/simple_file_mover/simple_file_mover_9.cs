#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover with a lot of unnecessary complexity.
// The program will read the source file and write its contents to the destination file.
// If the destination file already exists, it will be overwritten without warning.

void readFileAndWriteToDestination(FILE *source, FILE *destination) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), source)) > 0) {
        fwrite(buffer, 1, bytesRead, destination);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = fopen(argv[1], "r");
    if (sourceFile == NULL) {
        perror("Error opening source file");
        return 1;
    }

    FILE *destinationFile = fopen(argv[2], "w");
    if (destinationFile == NULL) {
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    readFileAndWriteToDestination(sourceFile, destinationFile);

    fclose(sourceFile);
    fclose(destinationFile);

    printf("File moved successfully from %s to %s\n", argv[1], argv[2]);

    return 0;
}

