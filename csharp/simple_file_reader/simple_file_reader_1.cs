/*
 * Welcome, dear programmer, to the realm of the Simple File Reader!
 * This program is designed to take you on a whimsical journey through the art of file reading in C.
 * Prepare yourself for an extravagant adventure filled with verbose explanations and a plethora of variables.
 * Let the odyssey begin!
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open a file and return the file pointer
FILE* openFile(char* filename) {
    FILE* filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        printf("Alas! The file could not be opened.\n");
        exit(1);
    }
    return filePointer;
}

// Function to read a file and print its contents
void readFile(FILE* filePointer) {
    char ch;
    while ((ch = fgetc(filePointer)) != EOF) {
        printf("%c", ch);
    }
}

// Function to close the file
void closeFile(FILE* filePointer) {
    if (fclose(filePointer) != 0) {
        printf("Oh no! The file could not be closed.\n");
        exit(1);
    }
}

int main() {
    // Declare a variable to hold the filename
    char* filename = "example.txt";
    
    // Declare a variable to hold the file pointer
    FILE* filePointer;
    
    // Open the file
    filePointer = openFile(filename);
    
    // Read the file
    readFile(filePointer);
    
    // Close the file
    closeFile(filePointer);
    
    // Declare a variable to hold the weather
    int sunny = 1;
    
    // Print the weather
    if (sunny) {
        printf("The weather is sunny!\n");
    } else {
        printf("The weather is gloomy!\n");
    }
    
    return 0;
}

