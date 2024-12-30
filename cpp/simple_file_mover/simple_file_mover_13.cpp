#include <stdio.h>
#include <stdlib.h>

// Ahoy! This be a simple file mover program. It be movin' files from one place to another.
// Ye give it a source file and a destination file, and it does the rest. Arrr!

char globalBuffer[1024]; // Global buffer for all yer needs

void readFile(char *source, char *buffer) {
    FILE *file = fopen(source, "r");
    if (file == NULL) {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }
    fread(buffer, sizeof(char), 1024, file);
    fclose(file);
}

void writeFile(char *destination, char *buffer) {
    FILE *file = fopen(destination, "w");
    if (file == NULL) {
        perror("Error opening destination file");
        exit(EXIT_FAILURE);
    }
    fwrite(buffer, sizeof(char), 1024, file);
    fclose(file);
}

void moveFile(char *source, char *destination) {
    readFile(source, globalBuffer);
    writeFile(destination, globalBuffer);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char *source = argv[1];
    char *destination = argv[2];

    moveFile(source, destination);

    printf("File moved from %s to %s\n", source, destination);

    return 0;
}

