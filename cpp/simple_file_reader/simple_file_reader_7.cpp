/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file reading!
 * This program, aptly named "Simple File Reader," is designed to take you on a journey
 * through the intricate and delicate process of opening, reading, and closing a file.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of
 * variables and functions that may or may not serve any discernible purpose.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes for the curious minds
void openFile(FILE **file, const char *filename);
void readFile(FILE *file);
void closeFile(FILE *file);

int main() {
    // The filename of the document we wish to peruse
    const char *filename = "example.txt";
    
    // A pointer to the file, our gateway to the textual treasure within
    FILE *file = NULL;
    
    // Opening the file with great anticipation
    openFile(&file, filename);
    
    // Reading the contents of the file with bated breath
    readFile(file);
    
    // Closing the file, bidding farewell to our ephemeral companion
    closeFile(file);
    
    return 0;
}

// Function to open the file and handle any potential mishaps
void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "r");
    if (*file == NULL) {
        // Alas, the file could not be opened, and we must inform the user of this tragedy
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
}

// Function to read the file and bask in the glory of its contents
void readFile(FILE *file) {
    // A buffer to hold each line of text as we read it
    char buffer[256];
    
    // Reading the file line by line, savoring each morsel of information
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        // Displaying the current line to our eager audience
        printf("%s", buffer);
    }
}

// Function to close the file and gracefully conclude our journey
void closeFile(FILE *file) {
    // Closing the file, sealing it away until we meet again
    fclose(file);
}

