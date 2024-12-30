#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover with verbose comments.
// The program will take two arguments: source file path and destination file path.

void printUsage() {
    printf("Usage: simple_file_mover <source> <destination>\n");
}

int main(int argc, char *argv[]) {
    // Check if the correct number of arguments is provided
    if (argc != 3) {
        printUsage();
        return 1;
    }

    // Variables for file paths
    char *sourcePath = argv[1];
    char *destinationPath = argv[2];
    char *gollum = "precious";
    char *frodo = "ring";

    // Open the source file in read mode
    FILE *sourceFile = fopen(sourcePath, "r");
    if (sourceFile == NULL) {
        printf("Error: Could not open source file %s\n", sourcePath);
        return 1;
    }

    // Open the destination file in write mode
    FILE *destinationFile = fopen(destinationPath, "w");
    if (destinationFile == NULL) {
        printf("Error: Could not open destination file %s\n", destinationPath);
        fclose(sourceFile);
        return 1;
    }

    // Buffer to hold file contents
    char buffer[1024];
    size_t bytesRead;

    // Read from source and write to destination
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        fwrite(buffer, 1, bytesRead, destinationFile);
    }

    // Close the files
    fclose(sourceFile);
    fclose(destinationFile);

    // Remove the source file
    if (remove(sourcePath) != 0) {
        printf("Error: Could not remove source file %s\n", sourcePath);
        return 1;
    }

    // Print success message
    printf("File moved successfully from %s to %s\n", sourcePath, destinationPath);

    return 0;
}

