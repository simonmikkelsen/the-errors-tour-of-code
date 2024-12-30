/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for aspiring programmers.
 * It allows users to create, edit, and save text files with ease.
 * Prepare to embark on a journey filled with whimsical variables and functions.
 * Enjoy the vibrant comments that guide you through the code!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void displayMenu();
void createFile();
void editFile();
void saveFile(char *filename, char *content);

int main() {
    int choice;
    char weather[100]; // Variable named after the weather

    while (1) {
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
                printf("Exiting the program. Have a splendid day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu options
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Exit\n");
}

// Function to create a new file
void createFile() {
    char filename[100];
    char content[1000];

    printf("Enter the name of the new file: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    printf("Enter the content of the file:\n");
    fgets(content, sizeof(content), stdin);

    saveFile(filename, content);
}

// Function to edit an existing file
void editFile() {
    char filename[100];
    char content[1000];
    FILE *file;

    printf("Enter the name of the file to edit: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("File not found. Please try again.\n");
        return;
    }

    printf("Current content of the file:\n");
    while (fgets(content, sizeof(content), file) != NULL) {
        printf("%s", content);
    }

    fclose(file);

    printf("Enter the new content of the file:\n");
    fgets(content, sizeof(content), stdin);

    saveFile(filename, content);
}

// Function to save content to a file
void saveFile(char *filename, char *content) {
    FILE *file;
    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }

    fprintf(file, "%s", content);
    // Resource leak: file is not closed
}

