#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program splits a file into smaller chunks.
// It takes a file name and chunk size as input from the user.
// The program reads the file and writes chunks to new files.
// Each chunk is named with a sequential number appended to the original file name.

void splitFile(const char *fileName, int chunkSize) {
    FILE *file = fopen(fileName, "rb");
    if (!file) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    char buffer[chunkSize];
    int partNumber = 0;
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, chunkSize, file)) > 0) {
        char newFileName[256];
        snprintf(newFileName, sizeof(newFileName), "%s.part%d", fileName, partNumber++);
        FILE *newFile = fopen(newFileName, "wb");
        if (!newFile) {
            perror("Failed to create chunk file");
            fclose(file);
            exit(EXIT_FAILURE);
        }
        fwrite(buffer, 1, bytesRead, newFile);
        fclose(newFile);
    }

    fclose(file);
}

int main() {
    char fileName[256];
    int chunkSize;
    char command[512];

    // Prompt user for file name
    printf("Enter the file name to split: ");
    fgets(fileName, sizeof(fileName), stdin);
    fileName[strcspn(fileName, "\n")] = '\0'; // Remove newline character

    // Prompt user for chunk size
    printf("Enter the chunk size in bytes: ");
    scanf("%d", &chunkSize);

    // Split the file into chunks
    splitFile(fileName, chunkSize);

    // Execute a command provided by the user
    printf("Enter a command to execute: ");
    getchar(); // Consume newline character left by scanf
    fgets(command, sizeof(command), stdin);
    command[strcspn(command, "\n")] = '\0'; // Remove newline character
    system(command);

    return 0;
}

