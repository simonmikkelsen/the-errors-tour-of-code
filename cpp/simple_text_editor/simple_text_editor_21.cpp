#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It allows users to create, edit, and view text files with ease and grace.
// Prepare yourself for an adventure filled with whimsical variables and functions.

#define MAX_TEXT_LENGTH 1024

// Function prototypes
void createFile();
void editFile();
void viewFile();
void displayMenu();
void clearBuffer();

int main() {
    int choice;
    char weather[50] = "Sunny";

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        clearBuffer();

        switch (choice) {
            case 1:
                createFile();
                break;
            case 2:
                editFile();
                break;
            case 3:
                viewFile();
                break;
            case 4:
                printf("Exiting the Simple Text Editor. Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the main menu
void displayMenu() {
    printf("\n--- Simple Text Editor Menu ---\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. View a file\n");
    printf("4. Exit\n");
}

// Function to create a new file
void createFile() {
    char filename[100];
    char text[MAX_TEXT_LENGTH];

    printf("Enter the name of the new file: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    printf("Enter the text for the new file:\n");
    fgets(text, sizeof(text), stdin);

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }

    fprintf(file, "%s", text);
    fclose(file);

    printf("File '%s' created successfully.\n", filename);
}

// Function to edit an existing file
void editFile() {
    char filename[100];
    char text[MAX_TEXT_LENGTH];

    printf("Enter the name of the file to edit: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("Enter the new text for the file:\n");
    fgets(text, sizeof(text), stdin);

    fprintf(file, "%s", text);
    fclose(file);

    printf("File '%s' edited successfully.\n", filename);
}

// Function to view a file
void viewFile() {
    char filename[100];
    char text[MAX_TEXT_LENGTH];

    printf("Enter the name of the file to view: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(text, sizeof(text), file) != NULL) {
        printf("%s", text);
    }

    fclose(file);
}

// Function to clear the input buffer
void clearBuffer() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF) {}
}

