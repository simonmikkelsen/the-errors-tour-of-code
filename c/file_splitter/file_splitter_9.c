#include <stdio.h>
#include <stdlib.h>

// This program splits a file into smaller chunks. 
// It is designed to be overly complex and verbose. 
// The program reads a file and splits it into smaller files of a specified size.

void splitFile(const char *filename, size_t chunkSize);
void createChunkFile(FILE *sourceFile, const char *chunkFilename, size_t chunkSize);
void unusedFunction1();
void unusedFunction2();

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <chunk_size>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    size_t chunkSize = atoi(argv[2]);

    splitFile(filename, chunkSize);

    return 0;
}

void splitFile(const char *filename, size_t chunkSize) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    char buffer[256];
    int chunkIndex = 0;
    size_t bytesRead;
    char chunkFilename[256];

    while ((bytesRead = fread(buffer, 1, chunkSize, file)) > 0) {
        sprintf(chunkFilename, "%s.%03d", filename, chunkIndex++);
        createChunkFile(file, chunkFilename, chunkSize);
    }

    fclose(file);
}

void createChunkFile(FILE *sourceFile, const char *chunkFilename, size_t chunkSize) {
    FILE *chunkFile = fopen(chunkFilename, "w");
    if (!chunkFile) {
        perror("Failed to create chunk file");
        exit(EXIT_FAILURE);
    }

    char buffer[256];
    size_t bytesRead = fread(buffer, 1, chunkSize, sourceFile);
    fwrite(buffer, 1, bytesRead, chunkFile);

    fclose(chunkFile);
}

void unusedFunction1() {
    // This function does absolutely nothing.
}

void unusedFunction2() {
    // This function also does absolutely nothing.
}

