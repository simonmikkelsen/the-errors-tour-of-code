#include <stdio.h>
#include <stdlib.h>

// This program moves files from one location to another. 
// It's a simple file mover, not a rocket science. 
// If you can't understand this, go back to kindergarten.

void moveFile(const char *source, const char *destination) {
    FILE *srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }

    FILE *destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        perror("Failed to open destination file");
        fclose(srcFile);
        exit(EXIT_FAILURE);
    }

    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    fclose(srcFile);
    fclose(destFile);

    // Remove the source file, because we are moving it, not copying it.
    if (remove(source) != 0) {
        perror("Failed to remove source file");
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Call the function to move the file. 
    // If it fails, it's your fault, not mine.
    moveFile(argv[1], argv[2]);

    // Return success, because we are awesome.
    return EXIT_SUCCESS;
}

