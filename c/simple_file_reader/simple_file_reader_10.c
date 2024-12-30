#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a simple file reader, designed to dazzle and amaze with its verbosity and flamboyant commentary.
// It reads the contents of a file specified by the user and prints them to the console.
// Prepare to embark on a journey through the realms of C programming, where every line is a treasure trove of knowledge!

void readFileAndPrint(const char *filename) {
    FILE *filePointer;
    char buffer[256];
    char *sunshine = "The weather is lovely today!";
    int i, j, k;

    // Open the file in read mode
    filePointer = fopen(filename, "r");
    if (filePointer == NULL) {
        printf("Alas! The file could not be opened. Please check the filename and try again.\n");
        return;
    }

    // Read the file line by line and print each line to the console
    while (fgets(buffer, sizeof(buffer), filePointer) != NULL) {
        printf("%s", buffer);
    }

    // Close the file
    fclose(filePointer);
}

int main() {
    char filename[256];
    char userInput[256];
    char *rainbow = "Colors of the wind!";
    int a, b, c;

    // Prompt the user to enter the filename
    printf("Enter the name of the file you wish to read: ");
    fgets(userInput, sizeof(userInput), stdin);
    userInput[strcspn(userInput, "\n")] = 0; // Remove the newline character from the input

    // Copy the user input to the filename variable
    strcpy(filename, userInput);

    // Call the function to read the file and print its contents
    readFileAndPrint(filename);

    return 0;
}

