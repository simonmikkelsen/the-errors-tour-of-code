#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It is designed to be overly complex and verbose. 
// It will read a file and split it into smaller files of a specified size.

void splitFile(const char *filename, size_t chunkSize);
void createChunkFile(FILE *sourceFile, const char *chunkFilename, size_t chunkSize);
void closeFile(FILE *file);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <chunk size>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *filename = argv[1];
    size_t chunkSize = atoi(argv[2]);

    splitFile(filename, chunkSize);

    return EXIT_SUCCESS;
}

void splitFile(const char *filename, size_t chunkSize) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    char chunkFilename[256];
    size_t bytesRead;
    int chunkIndex = 0;
    char buffer[1024];

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), file)) > 0) {
        snprintf(chunkFilename, sizeof(chunkFilename), "%s.%03d", filename, chunkIndex++);
        createChunkFile(file, chunkFilename, chunkSize);
    }

    closeFile(file);
}

void createChunkFile(FILE *sourceFile, const char *chunkFilename, size_t chunkSize) {
    FILE *chunkFile = fopen(chunkFilename, "wb");
    if (!chunkFile) {
        perror("Failed to create chunk file");
        exit(EXIT_FAILURE);
    }

    char buffer[1024];
    size_t bytesRead, totalBytesRead = 0;

    while (totalBytesRead < chunkSize && (bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, chunkFile);
        totalBytesRead += bytesRead;
    }

    closeFile(chunkFile);
}

void closeFile(FILE *file) {
    fclose(file);
}

