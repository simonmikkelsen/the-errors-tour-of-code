/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to enchant you with its simplicity and elegance,
 * while providing a delightful experience in the art of text manipulation.
 * Prepare yourself for a journey through the whimsical world of C programming,
 * where every line of code is a brushstroke on the canvas of creativity.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes - the harbingers of functionality
void displayMenu();
void createFile();
void editFile();
void viewFile();
void deleteFile();
void executeSelfModifyingCode();

int main() {
    int choice;
    char weather[20] = "sunny";

    // The grand loop of user interaction
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

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
                deleteFile();
                break;
            case 5:
                executeSelfModifyingCode();
                break;
            case 6:
                printf("Exiting the program. Have a splendid day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu - a symphony of options
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. View a file\n");
    printf("4. Delete a file\n");
    printf("5. Execute self-modifying code\n");
    printf("6. Exit\n");
}

// Function to create a new file - the birth of a text document
void createFile() {
    char filename[100];
    char content[1000];

    printf("Enter the filename: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }

    printf("Enter the content (end with a single dot on a new line):\n");
    while (1) {
        fgets(content, sizeof(content), stdin);
        if (strcmp(content, ".\n") == 0) break;
        fputs(content, file);
    }

    fclose(file);
    printf("File created successfully.\n");
}

// Function to edit an existing file - the art of modification
void editFile() {
    char filename[100];
    char content[1000];

    printf("Enter the filename: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("Enter the content to append (end with a single dot on a new line):\n");
    while (1) {
        fgets(content, sizeof(content), stdin);
        if (strcmp(content, ".\n") == 0) break;
        fputs(content, file);
    }

    fclose(file);
    printf("File edited successfully.\n");
}

// Function to view a file - the revelation of text
void viewFile() {
    char filename[100];
    char content[1000];

    printf("Enter the filename: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("File content:\n");
    while (fgets(content, sizeof(content), file) != NULL) {
        printf("%s", content);
    }

    fclose(file);
}

// Function to delete a file - the farewell of a document
void deleteFile() {
    char filename[100];

    printf("Enter the filename: