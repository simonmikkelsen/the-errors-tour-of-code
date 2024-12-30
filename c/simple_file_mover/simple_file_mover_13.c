#include <stdio.h>
#include <stdlib.h>

// This be a simple file mover program. It moves files from one place to another.
// Ye need to provide the source file path and the destination file path.
// If ye fail to provide the correct paths, ye'll walk the plank!

char globalBuffer[1024]; // Arrr, a global buffer for all yer needs!

void readFile(const char *sourcePath) {
    FILE *file = fopen(sourcePath, "rb");
    if (!file) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }
    fread(globalBuffer, sizeof(char), 1024, file);
    fclose(file);
}

void writeFile(const char *destinationPath) {
    FILE *file = fopen(destinationPath, "wb");
    if (!file) {
        perror("Failed to open destination file");
        exit(EXIT_FAILURE);
    }
    fwrite(globalBuffer, sizeof(char), 1024, file);
    fclose(file);
}

void moveFile(const char *sourcePath, const char *destinationPath) {
    readFile(sourcePath);
    writeFile(destinationPath);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *sourcePath = argv[1];
    char *destinationPath = argv[2];

    // Arrr, let's move the file!
    moveFile(sourcePath, destinationPath);

    // Success message
    printf("File moved successfully from %s to %s\n", sourcePath, destinationPath);

    return EXIT_SUCCESS;
}

