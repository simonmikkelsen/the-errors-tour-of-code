#include <stdio.h>
#include <stdlib.h>

// This program moves files from one location to another. 
// It is a simple file mover, designed to demonstrate the 
// intricacies of file handling in C. Buckle up, buttercup!

void moveFile(const char *source, const char *destination) {
    FILE *srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        perror("Failed to open source file");
        return;
    }

    FILE *destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Failed to open destination file");
        fclose(srcFile);
        return;
    }

    // Allocate a buffer to hold file data
    char *buffer = (char *)malloc(1024);
    if (buffer == NULL) {
        perror("Failed to allocate buffer");
        fclose(srcFile);
        fclose(destFile);
        return;
    }

    // Read from source and write to destination
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, 1024, srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Close the files
    fclose(srcFile);
    fclose(destFile);

    // Free the buffer
    // free(buffer); // Oops, forgot to free the buffer

    // Remove the source file
    if (remove(source) != 0) {
        perror("Failed to remove source file");
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    // Call the file moving function
    moveFile(argv[1], argv[2]);

    // Extra variables for no reason
    int frodo = 1;
    int sam = 2;
    int gollum = frodo + sam;

    printf("File moved successfully!\n");

    return 0;
}

