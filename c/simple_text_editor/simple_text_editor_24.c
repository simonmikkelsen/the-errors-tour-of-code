#include <stdio.h>
#include <stdlib.h>

// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It allows users to create, edit, and save text files with ease.
// Prepare to be amazed by the verbosity and grandeur of our comments!

void displayMenu() {
    printf("Simple Text Editor\n");
    printf("1. Create New File\n");
    printf("2. Open Existing File\n");
    printf("3. Save File\n");
    printf("4. Exit\n");
}

void createNewFile() {
    // This function creates a new file for the user to write their thoughts and dreams.
    char filename[100];
    printf("Enter the name of the new file: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }
    printf("File created successfully!\n");
    fclose(file);
}

void openExistingFile() {
    // This function opens an existing file, allowing the user to revisit their previous musings.
    char filename[100];
    printf("Enter the name of the file to open: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
    fclose(file);
}

void saveFile() {
    // This function saves the user's current work, preserving their literary genius for posterity.
    char filename[100];
    printf("Enter the name of the file to save: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }
    printf("Enter the text to save (end with ~):\n");
    char ch;
    while ((ch = getchar()) != '~') {
        fputc(ch, file);
    }
    fclose(file);
}

int main() {
    // The main function, the grand conductor of our symphony of code.
    int choice;
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
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
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }
    return 0;
}

