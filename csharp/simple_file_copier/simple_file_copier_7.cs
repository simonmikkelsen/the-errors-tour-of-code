#include <stdio.h>
#include <stdlib.h>

// This program is a simple file copier. It takes two arguments: the source file and the destination file.
// It opens the source file for reading and the destination file for writing.
// It reads the source file byte by byte and writes each byte to the destination file.
// The program demonstrates basic file I/O operations in C.
// It is designed to be simple and straightforward, with verbose comments to explain each step in detail.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile = fopen(source, "rb");
    FILE *destFile = fopen(destination, "wb");

    // Check if the source file was opened successfully
    if (srcFile == NULL) {
        fprintf(stderr, "Error: Could not open source file %s\n", source);
        exit(EXIT_FAILURE);
    }

    // Check if the destination file was opened successfully
    if (destFile == NULL) {
        fprintf(stderr, "Error: Could not open destination file %s\n", destination);
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    // Buffer to hold data read from the source file
    char buffer[1024];
    size_t bytesRead;

    // Read from the source file and write to the destination file
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Close the source file
    fclose(srcFile);

    // Close the destination file
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments are provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Call the copyFile function to perform the file copy operation
    copyFile(argv[1], argv[2]);

    // Return success
    return EXIT_SUCCESS;
}

