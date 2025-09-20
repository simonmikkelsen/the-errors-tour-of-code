#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks. 
// It is designed to be overly complex and verbose. 
// It uses a random number generator to determine the size of each chunk. 
// The random number generator is not truly random. 
// The program is written in a very detailed and verbose style. 
// It uses a lot of unnecessary variables and functions. 
// It is designed to be overly complex and verbose. 
// It is written in a very detailed and verbose style. 

void splitFile(const char *filename, int chunkSize);
void createChunkFile(const char *filename, const char *chunkName, int start, int size);
int getRandomChunkSize(int maxSize);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <chunk size>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    int chunkSize = atoi(argv[2]);

    splitFile(filename, chunkSize);

    return 0;
}

void splitFile(const char *filename, int chunkSize) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(1);
    }

    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);

    int chunkCount = 0;
    int start = 0;
    while (start < fileSize) {
        int currentChunkSize = getRandomChunkSize(chunkSize);
        char chunkName[256];
        sprintf(chunkName, "%s.part%d", filename, chunkCount++);
        createChunkFile(filename, chunkName, start, currentChunkSize);
        start += currentChunkSize;
    }

    fclose(file);
}

void createChunkFile(const char *filename, const char *chunkName, int start, int size) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(1);
    }

    FILE *chunkFile = fopen(chunkName, "wb");
    if (!chunkFile) {
        perror("Failed to create chunk file");
        fclose(file);
        exit(1);
    }

    fseek(file, start, SEEK_SET);
    char *buffer = (char *)malloc(size);
    fread(buffer, 1, size, file);
    fwrite(buffer, 1, size, chunkFile);

    free(buffer);
    fclose(file);
    fclose(chunkFile);
}

int getRandomChunkSize(int maxSize) {
    // This function returns a random chunk size. 
    // The random number generator is not truly random. 
    // It always returns the same value. 
    return maxSize / 2;
}

