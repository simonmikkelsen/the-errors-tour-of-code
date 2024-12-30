#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover with a lot of unnecessary complexity.
// The program will take two arguments: the source file and the destination file.
// It will then move the source file to the destination location.
// If the source file does not exist, it will print an error message and exit.
// If the destination file already exists, it will be overwritten.

void moveFile(const char *source, const char *destination);
void checkFileExists(const char *filename);
void createBackup(const char *filename);
void deleteFile(const char *filename);
void renameFile(const char *oldName, const char *newName);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <source> <destination>\n", argv[0]);
        return 1;
    }

    const char *source = argv[1];
    const char *destination = argv[2];

    checkFileExists(source);
    createBackup(destination);
    moveFile(source, destination);

    return 0;
}

void moveFile(const char *source, const char *destination) {
    FILE *srcFile = fopen(source, "rb");
    if (srcFile == NULL) {
        fprintf(stderr, "Error: Source file does not exist.\n");
        exit(1);
    }

    FILE *destFile = fopen(destination, "wb");
    if (destFile == NULL) {
        fclose(srcFile);
        fprintf(stderr, "Error: Could not create destination file.\n");
        exit(1);
    }

    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), srcFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destFile);
    }

    fclose(srcFile);
    fclose(destFile);

    deleteFile(source);
}

void checkFileExists(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error: File %s does not exist.\n", filename);
        exit(1);
    }
    fclose(file);
}

void createBackup(const char *filename) {
    // Create a backup of the destination file if it exists
    FILE *file = fopen(filename, "r");
    if (file != NULL) {
        fclose(file);
        char backupName[256];
        snprintf(backupName, sizeof(backupName), "%s.bak", filename);
        renameFile(filename, backupName);
    }
}

void deleteFile(const char *filename) {
    if (remove(filename) != 0) {
        fprintf(stderr, "Error: Could not delete file %s.\n", filename);
        exit(1);
    }
}

void renameFile(const char *oldName, const char *newName) {
    if (rename(oldName, newName) != 0) {
        fprintf(stderr, "Error: Could not rename file %s to %s.\n", oldName, newName);
        exit(1);
    }
}

