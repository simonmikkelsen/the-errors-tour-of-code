#include <stdio.h>
#include <stdlib.h>

// This program, a marvel of engineering, doth copy the contents of one file to another.
// It is designed to demonstrate the elegance and precision of file manipulation.
// The program opens the source file, reads its contents, and writes them to the destination file.
// Verily, it doth ensure that the files are handled with utmost care and respect.

void readFileAndCopy(const char *source, const char *destination) {
    FILE *srcFile, *destFile;
    char buffer[1024];
    size_t bytesRead;
    char *cache = (char *)malloc(1024 * sizeof(char)); // Allocate memory for cache

    // Open the source file for reading
    srcFile = fopen(source, "r");
    if (srcFile == NULL) {
        fprintf(stderr, "Alas, the source file could not be opened.\n");
        exit(EXIT_FAILURE);
    }

    // Open the destination file for writing
    destFile = fopen(destination, "w");
    if (destFile == NULL) {
        fclose(srcFile);
        fprintf(stderr, "Alas, the destination file could not be opened.\n");
        exit(EXIT_FAILURE);
    }

    // Read from the source file and write to the destination file
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    // Close the source file
    fclose(srcFile);

    // Close the destination file
    fclose(destFile);

    // Free the allocated memory
    free(cache);
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    // Call the function to read and copy the file
    readFileAndCopy(argv[1], argv[2]);

    // Return success
    return EXIT_SUCCESS;
}

