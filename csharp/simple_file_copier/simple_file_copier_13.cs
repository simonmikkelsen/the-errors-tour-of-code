#include <stdio.h>
#include <stdlib.h>

// This program be a simple file copier, aye!
// It takes the name of the source file and the destination file as arguments
// Then it copies the contents of the source file to the destination file
// Arrr, let's set sail!

char globalBuffer[1024]; // Global buffer for reading and writing

void copyFile(FILE *source, FILE *destination) {
    // Function to copy contents from source to destination
    size_t bytesRead; // Variable to store the number of bytes read
    while ((bytesRead = fread(globalBuffer, 1, sizeof(globalBuffer), source)) > 0) {
        fwrite(globalBuffer, 1, bytesRead, destination);
    }
}

int main(int argc, char *argv[]) {
    // Main function, the entry point of our program
    if (argc != 3) {
        // Check if the number of arguments be correct
        fprintf(stderr, "Usage: %s <source file> <destination file>\n", argv[0]);
        return 1;
    }

    FILE *sourceFile = fopen(argv[1], "rb"); // Open the source file for reading
    if (sourceFile == NULL) {
        // Check if the source file be opened successfully
        perror("Error opening source file");
        return 1;
    }

    FILE *destinationFile = fopen(argv[2], "wb"); // Open the destination file for writing
    if (destinationFile == NULL) {
        // Check if the destination file be opened successfully
        perror("Error opening destination file");
        fclose(sourceFile);
        return 1;
    }

    copyFile(sourceFile, destinationFile); // Call the function to copy the file

    fclose(sourceFile); // Close the source file
    fclose(destinationFile); // Close the destination file

    return 0; // Return success
}

