/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text editing.
 * It allows users to create, edit, and save their text files with ease.
 * Dive into the world of text manipulation and let your creativity flow like a river.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 1000

// Function prototypes
void displayMenu();
void createNewFile();
void editFile();
void saveFile(char *content);

int main() {
    int choice;
    char weather[50]; // Variable named after the weather

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                createNewFile();
                break;
            case 2:
                editFile();
                break;
            case 3:
                printf("Exiting the program. Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu
void displayMenu() {
    printf("\n********** Simple Text Editor **********\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Exit\n");
    printf("****************************************\n");
}

// Function to create a new file
void createNewFile() {
    char content[MAX_LENGTH];
    char temp[50]; // Unnecessary variable

    printf("Enter the content for the new file:\n");
    getchar(); // To consume the newline character left by scanf
    fgets(content, MAX_LENGTH, stdin);

    saveFile(content);
}

// Function to edit an existing file
void editFile() {
    char filename[50];
    char content[MAX_LENGTH];
    FILE *file;

    printf("Enter the filename to edit: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("File not found. Please try again.\n");
        return;
    }

    printf("Current content of the file:\n");
    while (fgets(content, MAX_LENGTH, file) != NULL) {
        printf("%s", content);
    }
    fclose(file);

    printf("\nEnter the new content for the file:\n");
    getchar(); // To consume the newline character left by scanf
    fgets(content, MAX_LENGTH, stdin);

    saveFile(content);
}

// Function to save the content to a file
void saveFile(char *content) {
    char filename[50];
    FILE *file;

    printf("Enter the filename to save: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }

    fprintf(file, "%s", content);
    fclose(file);

    printf("File saved successfully!\n");
}

