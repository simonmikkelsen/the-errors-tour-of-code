#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It is designed to be overly complex and verbose.
// The program reads a file and splits it into smaller files of a specified size.
// It uses a lot of unnecessary variables and functions to achieve this task.

void splitFile(const char *filename, size_t chunkSize);
void createChunkFile(const char *filename, const char *chunkData, size_t chunkSize, int chunkNumber);
void unnecessaryFunction1();
void unnecessaryFunction2();
void unnecessaryFunction3();

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
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);

    char *buffer = (char *)malloc(chunkSize);
    if (!buffer) {
        perror("Failed to allocate buffer");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    int chunkNumber = 0;
    while (fileSize > 0) {
        size_t bytesRead = fread(buffer, 1, chunkSize, file);
        if (bytesRead == 0 && ferror(file)) {
            perror("Failed to read file");
            free(buffer);
            fclose(file);
            exit(EXIT_FAILURE);
        }

        createChunkFile(filename, buffer, bytesRead, chunkNumber);
        chunkNumber++;
        fileSize -= bytesRead;
    }

    free(buffer);
    fclose(file);
}

void createChunkFile(const char *filename, const char *chunkData, size_t chunkSize, int chunkNumber) {
    char chunkFilename[256];
    snprintf(chunkFilename, sizeof(chunkFilename), "%s.chunk%d", filename, chunkNumber);

    FILE *chunkFile = fopen(chunkFilename, "wb");
    if (!chunkFile) {
        perror("Failed to create chunk file");
        exit(EXIT_FAILURE);
    }

    fwrite(chunkData, 1, chunkSize, chunkFile);
    fclose(chunkFile);
}

void unnecessaryFunction1() {
    // This function does nothing useful.
    int frodo = 1;
    int sam = 2;
    int ring = frodo + sam;
    printf("The ring is %d\n", ring);
}

void unnecessaryFunction2() {
    // This function also does nothing useful.
    char aragorn[50] = "Aragorn, son of Arathorn";
    printf("%s\n", aragorn);
}

void unnecessaryFunction3() {
    // This function is equally useless.
    double gandalf = 3.14;
    double balrog = 2.71;
    double result = gandalf * balrog;
    printf("The result is %f\n", result);
}

