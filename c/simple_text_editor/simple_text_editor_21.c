/*
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and view text files with ease.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void createFile();
void editFile();
void viewFile();
void displayMenu();
void handleUserChoice(int choice);

int main() {
    int userChoice;
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &userChoice);
        handleUserChoice(userChoice);
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

// Function to handle the user's choice
void handleUserChoice(int choice) {
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
            printf("Exiting the program. Goodbye!\n");
            exit(0);
        default:
            printf("Invalid choice. Please try again.\n");
    }
}

// Function to create a new file
void createFile() {
    char filename[100];
    char content[1000];
    FILE *file;

    printf("Enter the name of the new file: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }

    printf("Enter the content of the file:\n");
    getchar(); // Consume the newline character left by scanf
    fgets(content, sizeof(content), stdin);

    fprintf(file, "%s", content);
    fclose(file);

    printf("File created successfully!\n");
}

// Function to edit an existing file
void editFile() {
    char filename[100];
    char content[1000];
    FILE *file;

    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);

    file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    printf("Enter the content to append to the file:\n");
    getchar(); // Consume the newline character left by scanf
    fgets(content, sizeof(content), stdin);

    fprintf(file, "%s", content);
    fclose(file);

    printf("File edited successfully!\n");
}

// Function to view a file
void viewFile() {
    char filename[100];
    char content[1000];
    FILE *file;

    printf("Enter the name of the file to view: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    while (fgets(content, sizeof(content), file) != NULL) {
        printf("%s", content);
    }
    fclose(file);
}

