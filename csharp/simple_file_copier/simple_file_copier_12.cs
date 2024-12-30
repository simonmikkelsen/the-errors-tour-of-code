#include <stdio.h>
#include <stdlib.h>

// This program, a marvel of modern engineering, is designed to copy the contents of one file to another.
// It demonstrates the elegance and efficiency of file handling in C, a language of great power and flexibility.
// The program opens the source file, reads its contents, and writes them to the destination file with utmost precision.

void copyFile(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;

    // Open the source file in read mode, a task of great importance.
    srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        fprintf(stderr, "Error: Could not open source file %s\n", source);
        exit(EXIT_FAILURE);
    }

    // Open the destination file in write mode, a task equally important.
    destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        fclose(srcFile);
        fprintf(stderr, "Error: Could not open destination file %s\n", destination);
        exit(EXIT_FAILURE);
    }

    // Read from the source file and write to the destination file, a process of great precision and care.
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Close the source file, a task of finality and closure.
    fclose(srcFile);

    // Close the destination file, completing the cycle of creation.
    fclose(destFile);
}

int main(int argc, char *argv[]) {
    // The main function, the entry point of our grand program.
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Call the copyFile function, a function of great utility and purpose.
    copyFile(argv[1], argv[2]);

    // Return success, a signal of completion and triumph.
    return EXIT_SUCCESS;
}

