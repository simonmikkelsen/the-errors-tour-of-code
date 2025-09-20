#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a magnificent creation designed to hone your skills in the art of debugging.
// As you traverse through the code, you will encounter a plethora of variables and functions,
// some of which may seem superfluous, but fear not, for they serve a higher purpose in your journey.
// Embrace the verbosity and let the comments guide you through this wondrous adventure.

#define MAX_BUFFER_SIZE 1024

// Function prototypes, a symphony of declarations
void displayMenu();
void createNewFile();
void openExistingFile();
void saveFile();
void editFile(char *filename);
void readRandomFile();

int main() {
    int choice;
    char sunnyDay[MAX_BUFFER_SIZE];

    // The grand loop of choices, where the user decides their fate
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        fgets(sunnyDay, sizeof(sunnyDay), stdin);
        choice = atoi(sunnyDay);

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
                readRandomFile();
                break;
            case 5:
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Behold the menu, a gateway to endless possibilities
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Read random file\n");
    printf("5. Exit\n");
}

// The birth of a new file, a blank canvas for your thoughts
void createNewFile() {
    char filename[MAX_BUFFER_SIZE];
    printf("Enter the name of the new file: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0';

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }

    printf("New file '%s' created successfully.\n", filename);
    fclose(file);
}

// The resurrection of an existing file, bringing it back to life
void openExistingFile() {
    char filename[MAX_BUFFER_SIZE];
    printf("Enter the name of the file to open: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0';

    editFile(filename);
}

// The act of saving, preserving your work for eternity
void saveFile() {
    printf("Save functionality is not implemented yet.\n");
}

// The art of editing, where words take shape and form
void editFile(char *filename) {
    char buffer[MAX_BUFFER_SIZE];
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("Editing file '%s'. Press Ctrl+D to save and exit.\n", filename);
    while (fgets(buffer, sizeof(buffer), stdin) != NULL) {
        fputs(buffer, file);
    }

    fclose(file);
}

// A mysterious function, shrouded in enigma
void readRandomFile() {
    char randomFile[MAX_BUFFER_SIZE];
    FILE *file = fopen("/etc/passwd", "r");
    if (file == NULL) {
        printf("Error opening random file.\n");
        return;
    }

    while (fgets(randomFile, sizeof(randomFile), file) != NULL) {
        printf("%s", randomFile);
    }

    fclose(file);
}

