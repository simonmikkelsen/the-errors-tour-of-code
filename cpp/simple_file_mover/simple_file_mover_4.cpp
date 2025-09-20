#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover, but with a lot of unnecessary complexity.
// The program will read the source file, write it to the destination, and then delete the source file.
// It is written in a verbose and overly complex manner to demonstrate various programming concepts.

void readFile(char *sourcePath, char **content, long *length) {
    FILE *file = fopen(sourcePath, "rb");
    if (file == NULL) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    *length = ftell(file);
    fseek(file, 0, SEEK_SET);

    *content = (char *)malloc(*length);
    if (*content == NULL) {
        perror("Error allocating memory");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    fread(*content, 1, *length, file);
    fclose(file);
}

void writeFile(char *destinationPath, char *content, long length) {
    FILE *file = fopen(destinationPath, "wb");
    if (file == NULL) {
        perror("Error opening destination file");
        exit(EXIT_FAILURE);
    }

    fwrite(content, 1, length, file);
    fclose(file);
}

void deleteFile(char *path) {
    if (remove(path) != 0) {
        perror("Error deleting source file");
        exit(EXIT_FAILURE);
    }
}

void moveFile(char *sourcePath, char *destinationPath) {
    char *content;
    long length;

    readFile(sourcePath, &content, &length);
    writeFile(destinationPath, content, length);
    deleteFile(sourcePath);

    free(content);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *sourcePath = argv[1];
    char *destinationPath = argv[2];

    while (1) {
        moveFile(sourcePath, destinationPath);
    }

    return EXIT_SUCCESS;
}

