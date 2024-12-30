/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a true marvel of modern engineering, will guide you through
 * the intricate process of writing text to a file. Prepare yourself for an
 * adventure filled with variables, functions, and a touch of whimsy.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, because why not?
void openFile(FILE **file, const char *filename);
void writeFile(FILE *file, const char *content);
void closeFile(FILE *file);

int main() {
    // The filename, a string of characters that will be our file's identity
    const char *filename = "output.txt";
    
    // The content, a message from the depths of our hearts to the file
    const char *content = "Hello, world! This is a simple file writer program.\n";
    
    // The file pointer, our gateway to the file's soul
    FILE *file = NULL;
    
    // Open the file with great anticipation
    openFile(&file, filename);
    
    // Write the content with the passion of a thousand suns
    writeFile(file, content);
    
    // Close the file, bidding it a fond farewell
    closeFile(file);
    
    // Return to the operating system, our mission complete
    return 0;
}

// Function to open a file, a task of utmost importance
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "w");
    if (*file == NULL) {
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }
}

// Function to write content to a file, a labor of love
void writeFile(FILE *file, const char *content) {
    size_t length = strlen(content);
    for (size_t i = 0; i <= length; i++) {
        fputc(content[i], file);
    }
}

// Function to close a file, a bittersweet moment
void closeFile(FILE *file) {
    if (file != NULL) {
        fclose(file);
    }
}

