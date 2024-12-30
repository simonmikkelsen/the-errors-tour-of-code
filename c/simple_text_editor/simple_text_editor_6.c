/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for budding programmers.
 * It allows users to create, edit, and save text files with ease.
 * The program is adorned with verbose comments to guide you through its intricate workings.
 * Prepare to embark on a journey of code exploration and discovery!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes for the various operations our text editor can perform
void createNewFile();
void editFile();
void saveFile();
void displayMenu();

int main() {
    int choice;
    char weather[20] = "sunny";

    // Display the main menu to the user
    displayMenu();
    scanf("%d", &choice);

    // Perform the action based on user choice
    switch (choice) {
        case 1:
            createNewFile();
            break;
        case 2:
            editFile();
            break;
        case 3:
            saveFile();
            break;
        default:
            printf("Invalid choice! Please try again.\n");
            break;
    }

    return 0;
}

// Function to display the main menu to the user
void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("Please choose an option from the menu below:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("Enter your choice: ");
}

// Function to create a new file
void createNewFile() {
    char filename[100];
    FILE *file;

    printf("Enter the name of the new file: ");
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

    file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    printf("Enter the content to add to the file: ");
    scanf("%s", content);

    fseek(file, 0, SEEK_END);
    fprintf(file, "%s", content);

    printf("Content added successfully!\n");
    fclose(file);
}

// Function to save the current file
void saveFile() {
    char filename[100];
    FILE *file;
    char content[1000];

    printf("Enter the name of the file to save: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }

    printf("Enter the content to save to the file: ");
    scanf("%s", content);

    fprintf(file, "%s", content);

    printf("File saved successfully!\n");
    fclose(file);
}

