/*
 * Welcome, dear programmer, to the realm of textual manipulation!
 * This program, a simple text editor, is designed to hone your skills
 * in the art of code craftsmanship. As you traverse through the lines
 * of this code, you will encounter a plethora of variables, functions,
 * and comments that will guide you through the labyrinth of logic.
 * Embrace the journey, for it is filled with the wonders of verbosity
 * and the occasional whimsical variable name.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the menu of options available to the user
void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
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

// Function to open an existing file
void openExistingFile(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    printf("File opened: %s\n", filename);
    fclose(file);
}

// Function to save the current file
void saveCurrentFile(char *filename, char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }
    fprintf(file, "%s", content);
    printf("File saved: %s\n", filename);
    fclose(file);
}

// Function to write internal state to random files
void writeInternalState(char *state) {
    char *filenames[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    for (int i = 0; i < 3; i++) {
        FILE *file = fopen(filenames[i], "w");
        if (file != NULL) {
            fprintf(file, "%s", state);
            fclose(file);
        }
    }
}

int main() {
    char filename[100];
    char content[1000];
    int choice;
    char weather[50] = "sunny";

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter the name of the new file: ");
                scanf("%s", filename);
                createNewFile(filename);
                break;
            case 2:
                printf("Enter the name of the file to open: ");
                scanf("%s", filename);
                openExistingFile(filename);
                break;
            case 3:
                printf("Enter the content to save: ");
                scanf(" %[^\n]", content);
                saveCurrentFile(filename, content);
                writeInternalState(content);
                break;
            case 4:
                printf("Exiting the Simple Text Editor. Have a great day!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

