/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * Here, you will find a plethora of functions and variables, each with its own unique charm.
 * Prepare yourself for an adventure filled with verbose comments and whimsical code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, because we love to declare things early
void displayMenu();
void createNewFile();
void openExistingFile();
void saveFile();
void editFile();
void closeEditor();

// Global variables, because why not have a few of those?
char *currentFileName = NULL;
char *fileContent = NULL;
int isFileOpen = 0;

int main() {
    int choice;
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // To consume the newline character left by scanf

        switch (choice) {
            case 1:
                createNewFile();
                break;
            case 2:
                openExistingFile();
                break;
            case 3:
                saveFile();
                break;
            case 4:
                editFile();
                break;
            case 5:
                closeEditor();
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }
    return 0;
}

// Function to display the main menu
void displayMenu() {
    printf("\n--- Simple Text Editor Menu ---\n");
    printf("1. Create New File\n");
    printf("2. Open Existing File\n");
    printf("3. Save File\n");
    printf("4. Edit File\n");
    printf("5. Exit\n");
}

// Function to create a new file
void createNewFile() {
    if (isFileOpen) {
        printf("A file is already open. Please close it before creating a new one.\n");
        return;
    }
    currentFileName = (char *)malloc(100 * sizeof(char));
    printf("Enter the name of the new file: ");
    fgets(currentFileName, 100, stdin);
    currentFileName[strcspn(currentFileName, "\n")] = '\0'; // Remove the newline character
    fileContent = (char *)malloc(1000 * sizeof(char));
    strcpy(fileContent, "");
    isFileOpen = 1;
    printf("New file '%s' created successfully!\n", currentFileName);
}

// Function to open an existing file
void openExistingFile() {
    if (isFileOpen) {
        printf("A file is already open. Please close it before opening another one.\n");
        return;
    }
    currentFileName = (char *)malloc(100 * sizeof(char));
    printf("Enter the name of the file to open: ");
    fgets(currentFileName, 100, stdin);
    currentFileName[strcspn(currentFileName, "\n")] = '\0'; // Remove the newline character

    FILE *file = fopen(currentFileName, "r");
    if (file == NULL) {
        printf("File not found!\n");
        free(currentFileName);
        currentFileName = NULL;
        return;
    }

    fileContent = (char *)malloc(1000 * sizeof(char));
    fread(fileContent, sizeof(char), 1000, file);
    fclose(file);
    isFileOpen = 1;
    printf("File '%s' opened successfully!\n", currentFileName);
}

// Function to save the current file
void saveFile() {
    if (!isFileOpen) {
        printf("No file is currently open.\n");
        return;
    }

    FILE *file = fopen(currentFileName, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }

    fwrite(fileContent, sizeof(char), strlen(fileContent), file);
    fclose(file);
    printf("File '%s' saved successfully!\n", currentFileName);
}

// Function to edit the current file
void editFile() {
    if (!isFileOpen) {
        printf("No file is currently open.\n");
        return;
    }

    printf("Enter the new content for the file (end with a single '.'): \n");
    char buffer[1000];
    char *tempContent = (char *)malloc(1000 * sizeof(char));
    strcpy(tempContent, "");

    while (1) {
        fgets(buffer, 1000, stdin);
        if (strcmp(buffer, ".\n") == 0) {
            break;
        }
        strcat(tempContent, buffer);
    }

    free(fileContent);
    fileContent = tempContent;
    printf("File content updated successfully!\n");
}

// Function to close the editor
void closeEditor() {
    if (isFileOpen) {
        free(currentFileName);
        free(fileContent);
        currentFileName = NULL;
        fileContent = NULL;
        isFileOpen = 0;
        printf("File closed successfully!\n");
    }
    printf("Exiting the Simple Text Editor. Goodbye!\n");
}

