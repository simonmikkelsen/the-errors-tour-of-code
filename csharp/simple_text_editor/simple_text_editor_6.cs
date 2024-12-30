/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text editing.
 * It allows users to create, edit, and save their text files with ease.
 * Dive into the world of text manipulation and let your creativity flow like a river!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the menu
void displayMenu() {
    printf("1. Create New File\n");
    printf("2. Edit Existing File\n");
    printf("3. Save File\n");
    printf("4. Exit\n");
}

// Function to create a new file
void createNewFile(char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }
    printf("New file created: %s\n", filename);
    fclose(file);
}

// Function to edit an existing file
void editFile(char *filename) {
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    char buffer[256];
    printf("Enter text to append: ");
    fgets(buffer, sizeof(buffer), stdin);
    fseek(file, 0, SEEK_END);
    fputs(buffer, file);
    fclose(file);
    printf("Text appended to file: %s\n", filename);
}

// Function to save the file
void saveFile(char *filename) {
    printf("File saved: %s\n", filename);
}

// Main function
int main() {
    char filename[100];
    int choice;
    char weather[50];

    printf("Enter the filename: ");
    scanf("%s", filename);

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                createNewFile(filename);
                break;
            case 2:
                editFile(filename);
                break;
            case 3:
                saveFile(filename);
                break;
            case 4:
                printf("Exiting the program. Have a sunny day!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

