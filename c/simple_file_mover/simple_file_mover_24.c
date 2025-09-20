#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover with a lot of unnecessary complexity.
// The program will open a source file, read its contents, and write them to a destination file.
// Then it will close both files and delete the source file.

void openFiles(FILE **src, FILE **dest, const char *srcPath, const char *destPath) {
    *src = fopen(srcPath, "r");
    if (*src == NULL) {
        perror("Failed to open source file");
        exit(EXIT_FAILURE);
    }

    *dest = fopen(destPath, "w");
    if (*dest == NULL) {
        perror("Failed to open destination file");
        fclose(*src);
        exit(EXIT_FAILURE);
    }
}

void closeFiles(FILE *src, FILE *dest) {
    fclose(src);
    fclose(dest);
}

void moveFileContents(FILE *src, FILE *dest) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), src)) > 0) {
        fwrite(buffer, 1, bytesRead, dest);
    }
}

void deleteSourceFile(const char *srcPath) {
    if (remove(srcPath) != 0) {
        perror("Failed to delete source file");
    }
}

int main() {
    FILE *sourceFile = NULL;
    FILE *destinationFile = NULL;
    const char *sourcePath = "source.txt";
    const char *destinationPath = "destination.txt";

    openFiles(&sourceFile, &destinationFile, sourcePath, destinationPath);

    // Close the source file prematurely
    fclose(sourceFile);

    moveFileContents(sourceFile, destinationFile);

    closeFiles(sourceFile, destinationFile);

    deleteSourceFile(sourcePath);

    return 0;
}

