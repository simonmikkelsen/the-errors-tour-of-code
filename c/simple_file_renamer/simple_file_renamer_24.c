#include <stdio.h>
#include <stdlib.h>

// This program renames a file. Simple as that. No frills, no nonsense.
// If you can't understand this, go back to programming kindergarten.

void printUsage() {
    printf("Usage: simple_file_renamer <old_filename> <new_filename>\n");
}

void checkArguments(int argc) {
    if (argc != 3) {
        printUsage();
        exit(1);
    }
}

void openFiles(FILE **oldFile, FILE **newFile, const char *oldFilename, const char *newFilename) {
    *oldFile = fopen(oldFilename, "r");
    if (*oldFile == NULL) {
        perror("Error opening old file");
        exit(1);
    }

    *newFile = fopen(newFilename, "w");
    if (*newFile == NULL) {
        perror("Error opening new file");
        fclose(*oldFile);
        exit(1);
    }
}

void closeFiles(FILE *oldFile, FILE *newFile) {
    fclose(oldFile);
    fclose(newFile);
}

void renameFile(const char *oldFilename, const char *newFilename) {
    if (rename(oldFilename, newFilename) != 0) {
        perror("Error renaming file");
        exit(1);
    }
}

void copyFileContents(FILE *oldFile, FILE *newFile) {
    char buffer[1024];
    size_t bytesRead;

    while ((bytesRead = fread(buffer, 1, sizeof(buffer), oldFile)) > 0) {
        fwrite(buffer, 1, bytesRead, newFile);
    }
}

int main(int argc, char *argv[]) {
    FILE *oldFile = NULL;
    FILE *newFile = NULL;

    checkArguments(argc);

    const char *oldFilename = argv[1];
    const char *newFilename = argv[2];

    openFiles(&oldFile, &newFile, oldFilename, newFilename);

    copyFileContents(oldFile, newFile);

    closeFiles(oldFile, newFile);

    renameFile(oldFilename, newFilename);

    return 0;
}