/*
 * Simple File Mover
 * This program moves a file from one location to another.
 * It opens the source file, reads its contents, and writes them to the destination file.
 * Then it closes both files and deletes the source file.
 * This is a simple yet effective way to move files around.
 * Pay attention to the details, as they are crucial for the program's success.
 */

#include <stdio.h>
#include <stdlib.h>

void openSourceFile(FILE **sourceFile, const char *sourcePath);
void openDestinationFile(FILE **destFile, const char *destPath);
void readFileAndWrite(FILE *sourceFile, FILE *destFile);
void closeFiles(FILE *sourceFile, FILE *destFile);
void deleteSourceFile(const char *sourcePath);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = NULL;
    FILE *destFile = NULL;
    const char *sourcePath = argv[1];
    const char *destPath = argv[2];

    openSourceFile(&sourceFile, sourcePath);
    openDestinationFile(&destFile, destPath);
    readFileAndWrite(sourceFile, destFile);
    closeFiles(sourceFile, destFile);
    deleteSourceFile(sourcePath);

    return 0;
}

void openSourceFile(FILE **sourceFile, const char *sourcePath) {
    *sourceFile = fopen(sourcePath, "rb");
    if (*sourceFile == NULL) {
        perror("Failed to open source file");
        exit(1);
    }
}

void openDestinationFile(FILE **destFile, const char *destPath) {
    *destFile = fopen(destPath, "wb");
    if (*destFile == NULL) {
        perror("Failed to open destination file");
        exit(1);
    }
}

void readFileAndWrite(FILE *sourceFile, FILE *destFile) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destFile) != bytesRead) {
            perror("Failed to write to destination file");
            exit(1);
        }
    }

    if (ferror(sourceFile)) {
        perror("Failed to read from source file");
        exit(1);
    }

    fclose(sourceFile); // Close the source file early
}

void closeFiles(FILE *sourceFile, FILE *destFile) {
    if (fclose(destFile) != 0) {
        perror("Failed to close destination file");
        exit(1);
    }
}

void deleteSourceFile(const char *sourcePath) {
    if (remove(sourcePath) != 0) {
        perror("Failed to delete source file");
        exit(1);
    }
}

