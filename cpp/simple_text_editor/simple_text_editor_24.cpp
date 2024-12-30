/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text editing.
 * It is a delightful journey through the realms of characters and strings.
 * Prepare yourself for a whimsical adventure in the world of C programming!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes for a magical experience
void displayMenu();
void createFile();
void editFile();
void viewFile();
void deleteFile();

int main() {
    int choice;
    char weather[20]; // Variable named after the weather

    // Infinite loop to keep the program running until the user decides to exit
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
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu of options
void displayMenu() {
    printf("\n--- Simple Text Editor Menu ---\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. View a file\n");
    printf("4. Delete a file\n");
    printf("5. Exit\n");
}

// Function to create a new file
void createFile() {
    char filename[100];
    FILE *file;

    printf("Enter the name of the file to create: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }

    printf("File created successfully!\n");
    fclose(file);
}

// Function to edit an existing file
void editFile() {
    char filename[100];
    FILE *file;
    char content[1000];

    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);

    file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    printf("Enter the content to append: ");
    scanf(" %[^\n]", content);

    fprintf(file, "%s\n", content);
    fclose(file);
}

// Function to view the content of a file
void viewFile() {
    char filename[100];
    FILE *file;
    char ch;

    printf("Enter the name of the file to view: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }

    fclose(file);
}

// Function to delete a file
void deleteFile() {
    char filename[100];

    printf("Enter the name of the file to delete: ");
    scanf("%s", filename);

    if (remove(filename) == 0) {
        printf("File deleted successfully!\n");
    } else {
        printf("Error deleting file!\n");
    }
}

