/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for budding programmers.
 * It allows users to create, edit, and save text files with ease.
 * The program is adorned with verbose comments to guide you through its intricate workings.
 * Enjoy the journey through the code, and may your programming skills flourish!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER_SIZE 1024

// Function prototypes
void displayMenu();
void createFile();
void editFile();
void saveFile(char *filename, char *content);
void clearScreen();

int main() {
    int choice;
    char filename[MAX_BUFFER_SIZE];
    char content[MAX_BUFFER_SIZE];
    char weather[MAX_BUFFER_SIZE];

    while (1) {
        clearScreen();
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        switch (choice) {
            case 1:
                createFile();
                break;
            case 2:
                editFile();
                break;
            case 3:
                printf("Enter filename to save: ");
                fgets(filename, MAX_BUFFER_SIZE, stdin);
                filename[strcspn(filename, "\n")] = '\0'; // Remove newline character
                printf("Enter content to save: ");
                fgets(content, MAX_BUFFER_SIZE, stdin);
                saveFile(filename, content);
                break;
            case 4:
                printf("Exiting the program. Have a wonderful day!\n");
                exit(0);
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the main menu
void displayMenu() {
    printf("Simple Text Editor\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save a file\n");
    printf("4. Exit\n");
}

// Function to create a new file
void createFile() {
    printf("Creating a new file...\n");
    // Additional code for creating a file can be added here
}

// Function to edit an existing file
void editFile() {
    printf("Editing an existing file...\n");
    // Additional code for editing a file can be added here
}

// Function to save content to a file
void saveFile(char *filename, char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }
    fprintf(file, "%s", content);
    fclose(file);
    printf("File saved successfully.\n");
}

// Function to clear the screen
void clearScreen() {
    // This function clears the console screen for a fresh start
    printf("\033[H\033[J");
}

