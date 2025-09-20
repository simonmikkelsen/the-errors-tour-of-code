#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple yet effective tool for file management.
// The program takes two arguments: the source file path and the destination file path.
// It then attempts to move the file from the source to the destination.
// If the operation is successful, it prints a success message.
// Otherwise, it prints an error message.

void printUsage() {
    printf("Usage: simple_file_mover <source> <destination>\n");
}

void printSuccessMessage() {
    printf("File moved successfully!\n");
}

void printErrorMessage() {
    printf("Error moving file. Please check the file paths and try again.\n");
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printUsage();
        return 1;
    }

    char *sourcePath = argv[1];
    char *destinationPath = argv[2];

    FILE *sourceFile = fopen(sourcePath, "r");
    if (sourceFile == NULL) {
        printErrorMessage();
        return 1;
    }

    FILE *destinationFile = fopen(destinationPath, "w");
    if (destinationFile == NULL) {
        fclose(sourceFile);
        printErrorMessage();
        return 1;
    }

    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }

    fclose(sourceFile);
    fclose(destinationFile);

    if (remove(sourcePath) != 0) {
        printErrorMessage();
        return 1;
    }

    printSuccessMessage();
    return 0;
}

