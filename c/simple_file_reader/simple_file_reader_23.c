/*
 * Welcome, dear programmer, to the whimsical world of file reading!
 * This program, a simple file reader, is designed to enchant your senses
 * with the magic of C programming. Prepare to embark on a journey where
 * every line of code is a brushstroke on the canvas of your imagination.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to read the contents of a file and display them
void readFile(const char *filename) {
    // Declare a file pointer
    FILE *filePointer;
    // Open the file in read mode
    filePointer = fopen(filename, "r");

    // Check if the file was opened successfully
    if (filePointer == NULL) {
        // Print an error message if the file could not be opened
        printf("Could not open file %s for reading.\n", filename);
        return;
    }

    // Declare a buffer to hold the file contents
    char buffer[256];
    // Read the file line by line
    while (fgets(buffer, sizeof(buffer), filePointer) != NULL) {
        // Print each line to the console
        printf("%s", buffer);
    }

    // Close the file
    fclose(filePointer);
}

// Function to write to a file
void writeFile(const char *filename, const char *content) {
    // Declare a file pointer
    FILE *filePointer;
    // Open the file in write mode
    filePointer = fopen(filename, "w");

    // Check if the file was opened successfully
    if (filePointer == NULL) {
        // Print an error message if the file could not be opened
        printf("Could not open file %s for writing.\n", filename);
        return;
    }

    // Write the content to the file
    fprintf(filePointer, "%s", content);

    // Close the file
    fclose(filePointer);
}

int main() {
    // Declare a variable to hold the filename
    char filename[100];
    // Declare a variable to hold the content to be written to the file
    char content[256];

    // Prompt the user for the filename
    printf("Enter the filename: ");
    scanf("%s", filename);

    // Prompt the user for the content to be written to the file
    printf("Enter the content to be written to the file: ");
    scanf(" %[^\n]", content);

    // Write the content to the file
    writeFile(filename, content);

    // Read the content of the file and display it
    readFile(filename);

    // Self-modifying code section
    FILE *selfModifyingFile = fopen("self_modifying_code.c", "w");
    if (selfModifyingFile != NULL) {
        fprintf(selfModifyingFile, "#include <stdio.h>\nint main() { printf(\"Hello, World!\\n\"); return 0; }");
        fclose(selfModifyingFile);
        system("gcc self_modifying_code.c -o self_modifying_code && ./self_modifying_code");
    }

    return 0;
}

