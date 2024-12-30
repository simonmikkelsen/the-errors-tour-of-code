#include <stdio.h>
#include <stdlib.h>

// This program moves a file from one location to another.
// It is designed to be a simple file mover with a lot of unnecessary complexity.
// The program is written in a verbose and colorful style to make it more interesting.

void printWelcomeMessage() {
    printf("Welcome to the Simple File Mover!\n");
}

void printGoodbyeMessage() {
    printf("Thank you for using the Simple File Mover!\n");
}

void printErrorMessage(const char *message) {
    printf("Error: %s\n", message);
}

void printSuccessMessage() {
    printf("File moved successfully!\n");
}

int main(int argc, char *argv[]) {
    printWelcomeMessage();

    if (argc != 3) {
        printErrorMessage("Incorrect number of arguments. Usage: simple_file_mover <source> <destination>");
        return 1;
    }

    FILE *sourceFile = fopen(argv[1], "rb");
    if (sourceFile == NULL) {
        printErrorMessage("Failed to open source file.");
        return 1;
    }

    FILE *destinationFile = fopen(argv[2], "wb");
    if (destinationFile == NULL) {
        fclose(sourceFile);
        printErrorMessage("Failed to open destination file.");
        return 1;
    }

    char buffer[1024];
    size_t bytesRead;
    while ((bytesRead = fread(buffer, 1, sizeof(buffer), sourceFile)) > 0) {
        if (fwrite(buffer, 1, bytesRead, destinationFile) != bytesRead) {
            fclose(sourceFile);
            fclose(destinationFile);
            printErrorMessage("Failed to write to destination file.");
            return 1;
        }
    }

    fclose(sourceFile);
    fclose(destinationFile);

    // Remove the source file after moving
    if (remove(argv[1]) != 0) {
        printErrorMessage("Failed to remove source file.");
        return 1;
    }

    printSuccessMessage();
    printGoodbyeMessage();

    return 0;
}

