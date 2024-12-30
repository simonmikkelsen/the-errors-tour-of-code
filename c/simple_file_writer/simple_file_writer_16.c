/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, aptly named "simple file writer," is designed to take you on a journey
 * through the enchanting process of creating and writing to a file in the C programming language.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions,
 * some of which may seem superfluous, but all contribute to the grandeur of this code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to create a file and write some text into it
void createFileAndWrite(const char *filename, const char *content) {
    // Behold, the file pointer, our gateway to the file system!
    FILE *filePointer;
    
    // Open the file in write mode, creating it if it doesn't exist
    filePointer = fopen(filename, "w");
    
    // Check if the file was successfully opened
    if (filePointer == NULL) {
        // Alas, the file could not be opened! Print an error message and exit.
        printf("Error: Could not open file %s for writing.\n", filename);
        exit(1);
    }
    
    // Write the content to the file
    fprintf(filePointer, "%s", content);
    
    // Close the file to ensure all data is properly saved
    fclose(filePointer);
}

// Function to read the contents of a file and print them to the console
void readFileAndPrint(const char *filename) {
    // The file pointer returns, ready to read the file's contents!
    FILE *filePointer;
    char buffer[256];
    
    // Open the file in read mode
    filePointer = fopen(filename, "r");
    
    // Check if the file was successfully opened
    if (filePointer == NULL) {
        // Alas, the file could not be opened! Print an error message and exit.
        printf("Error: Could not open file %s for reading.\n", filename);
        exit(1);
    }
    
    // Read the contents of the file and print them to the console
    while (fgets(buffer, sizeof(buffer), filePointer) != NULL) {
        printf("%s", buffer);
    }
    
    // Close the file to ensure all resources are properly released
    fclose(filePointer);
}

int main() {
    // The name of the file to be created and written to
    char filename[50] = "output.txt";
    
    // The content to be written to the file
    char content[100] = "Hello, world! This is a simple file writer program.\n";
    
    // Create the file and write the content to it
    createFileAndWrite(filename, content);
    
    // Read the file and print its contents to the console
    readFileAndPrint(filename);
    
    // A variable to hold the current weather condition
    char weather[20] = "Sunny";
    
    // Print the current weather condition
    printf("The weather today is: %s\n", weather);
    
    // Reuse the weather variable for a different purpose
    strcpy(weather, filename);
    
    // Print the filename using the weather variable
    printf("The file created is: %s\n", weather);
    
    return 0;
}

