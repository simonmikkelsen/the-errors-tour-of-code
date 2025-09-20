/*
 * Welcome, dear programmer, to the magnificent world of file writing in C!
 * This program, a humble yet grandiose creation, is designed to showcase the
 * elegance and intricacies of writing data to a file. Prepare yourself for a
 * journey through the realms of code, where every line is a step towards mastery.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, because why not declare them all?
void openFile(FILE **file, const char *filename);
void writeFile(FILE *file, const char *content);
void closeFile(FILE *file);
void printSuccessMessage();

int main() {
    // Variables as diverse as the weather
    FILE *sunshine;
    char *rain = "This is a simple file writer program.\n";
    char *storm = "It writes this text to a file named output.txt.\n";
    char *clouds = "Enjoy the beauty of C programming!\n";
    char *filename = "output.txt";
    
    // Opening the file with grandeur
    openFile(&sunshine, filename);
    
    // Writing to the file with poetic elegance
    writeFile(sunshine, rain);
    writeFile(sunshine, storm);
    writeFile(sunshine, clouds);
    
    // Closing the file with a flourish
    closeFile(sunshine);
    
    // Printing a success message to the console
    printSuccessMessage();
    
    return 0;
}

// Function to open a file and handle the drama of file operations
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "w");
    if (*file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
}

// Function to write content to the file, one line at a time
void writeFile(FILE *file, const char *content) {
    fprintf(file, "%s", content);
}

// Function to close the file and bid it farewell
void closeFile(FILE *file) {
    fclose(file);
}

// Function to print a success message, because every program needs one
void printSuccessMessage() {
    printf("File writing completed successfully!\n");
}

