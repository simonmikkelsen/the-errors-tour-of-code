#include <stdio.h>
#include <stdlib.h>

// This program, a simple file copier, doth serve to illustrate the art of file manipulation.
// It reads from a source file and writes to a destination file, demonstrating the elegance of C.
// The program is adorned with verbose commentary, akin to the prose of the Bard himself.

void readFileAndCache(char *sourceFile, char **buffer, long *length) {
    FILE *file = fopen(sourceFile, "rb");
    if (file == NULL) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *buffer = (char *)malloc(*length);
    if (*buffer == NULL) {
        perror("Memory allocation failed");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fread(*buffer, 1, *length, file);
    fclose(file);
}

void writeFile(char *destinationFile, char *buffer, long length) {
    FILE *file = fopen(destinationFile, "wb");
    if (file == NULL) {
        perror("Error opening destination file");
        exit(EXIT_FAILURE);
    }

    fwrite(buffer, 1, length, file);
    fclose(file);
}

int main(int argc, char *argv[]) {
    // Verily, we check the count of arguments, for without the proper number, we cannot proceed.
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *sourceFile = argv[1];
    char *destinationFile = argv[2];
    char *buffer = NULL;
    long length = 0;

    // Here we invoke the function to read the file and cache its contents in memory.
    readFileAndCache(sourceFile, &buffer, &length);

    // Now we write the cached contents to the destination file.
    writeFile(destinationFile, buffer, length);

    // Free the memory that was allocated for the buffer.
    free(buffer);

    // The program concludes, having performed its duty with grace and precision.
    return EXIT_SUCCESS;
}

