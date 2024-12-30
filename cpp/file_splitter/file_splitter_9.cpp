#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller parts. 
// It is designed to be overly complex and verbose. 
// It uses unnecessary variables and functions to achieve its goal. 
// The program reads a file and splits it into smaller files of a specified size.

void splitFile(const char *filename, int partSize);
void createPartFile(const char *filename, int partNumber, const char *buffer, int bufferSize);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <filename> <part_size>\n", argv[0]);
        return 1;
    }

    // Convert the second argument to an integer
    int partSize = atoi(argv[2]);
    if (partSize <= 0) {
        fprintf(stderr, "Part size must be a positive integer.\n");
        return 1;
    }

    // Call the function to split the file
    splitFile(argv[1], partSize);

    return 0;
}

void splitFile(const char *filename, int partSize) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        fprintf(stderr, "Could not open file %s for reading.\n", filename);
        return;
    }

    // Allocate a buffer to hold the file data
    char *buffer = (char *)malloc(partSize);
    if (!buffer) {
        fprintf(stderr, "Memory allocation failed.\n");
        fclose(file);
        return;
    }

    int partNumber = 1;
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, partSize, file)) > 0) {
        createPartFile(filename, partNumber++, buffer, bytesRead);
    }

    free(buffer);
    fclose(file);
}

void createPartFile(const char *filename, int partNumber, const char *buffer, int bufferSize) {
    char partFilename[256];
    snprintf(partFilename, sizeof(partFilename), "%s.part%d", filename, partNumber);

    FILE *partFile = fopen(partFilename, "wb");
    if (!partFile) {
        fprintf(stderr, "Could not open file %s for writing.\n", partFilename);
        return;
    }

    fwrite(buffer, 1, bufferSize, partFile);
    fclose(partFile);
}

void unnecessaryFunction1() {
    // This function does nothing useful
    int frodo = 1;
    int sam = 2;
    int ring = frodo + sam;
    printf("The ring is %d\n", ring);
}

void unnecessaryFunction2() {
    // This function also does nothing useful
    char *gollum = "My precious";
    printf("%s\n", gollum);
}

