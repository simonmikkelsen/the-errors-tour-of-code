/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a true marvel of modern engineering, is designed to read
 * the contents of a file and display them on the screen. Prepare yourself
 * for an adventure through the realms of C programming, where every line
 * of code is a treasure trove of knowledge and excitement.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open the file and return the file pointer
FILE* openFile(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Oh no! The file could not be opened. Please check the filename and try again.\n");
        exit(1);
    }
    return file;
}

// Function to read the contents of the file and print them
void readFile(FILE* file) {
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
}

// Function to close the file
void closeFile(FILE* file) {
    if (fclose(file) != 0) {
        printf("Alas! The file could not be closed properly.\n");
    }
}

int main() {
    // Declare a variable to hold the filename
    const char* filename = "example.txt";
    
    // Open the file
    FILE* file = openFile(filename);
    
    // Read the file
    readFile(file);
    
    // Close the file
    closeFile(file);
    
    // Declare some unnecessary variables
    int sunny = 0, rainy = 1, cloudy = 2;
    char weather[10] = "sunny";
    
    // Print a farewell message
    printf("The file has been read successfully. Farewell, intrepid programmer!\n");
    
    return 0;
}

