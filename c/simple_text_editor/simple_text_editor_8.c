/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for budding programmers.
 * It allows users to create, edit, and save text files with ease.
 * The program is adorned with a plethora of comments to guide you through its intricate workings.
 * Enjoy the journey through the labyrinth of code!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void displayMenu();
void createFile();
void editFile();
void saveFile();

// Global variables
char *buffer;
int bufferSize;

int main() {
    int choice;
    bufferSize = 1024; // Initial buffer size
    buffer = (char *)malloc(bufferSize * sizeof(char)); // Allocate memory for the buffer

    // Main loop
    while (1) {
        displayMenu();
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                createFile();
                break;
            case 2:
                editFile();
                break;
            case 3:
                saveFile();
                break;
            case 4:
                printf("Exiting the program. Farewell!\n");
                free(buffer); // Free the allocated memory
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
    printf("Enter your choice: ");
}

// Function to create a new file
void createFile() {
    printf("Creating a new file...\n");
    // Clear the buffer
    memset(buffer, 0, bufferSize);
}

// Function to edit an existing file
void editFile() {
    printf("Editing the file...\n");
    char tempBuffer[256]; // Temporary buffer for user input
    printf("Enter text (type 'END' to finish):\n");

    while (1) {
        fgets(tempBuffer, sizeof(tempBuffer), stdin);
        if (strncmp(tempBuffer, "END", 3) == 0) {
            break;
        }
        strcat(buffer, tempBuffer);
    }
}

// Function to save the current file
void saveFile() {
    char fileName[256];
    printf("Enter the file name to save: ");
    scanf("%s", fileName);

    FILE *file = fopen(fileName, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }

    fprintf(file, "%s", buffer);
    fclose(file);
    printf("File saved successfully.\n");
}

