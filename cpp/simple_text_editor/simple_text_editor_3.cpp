#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the realm of text editing!
// This program is a simple text editor, designed to provide you with the most delightful experience of editing text files.
// Bask in the glory of its verbosity and the myriad of functions and variables that adorn its code.

#define MAX_FILENAME_LENGTH 100
#define MAX_TEXT_LENGTH 1000

// Function to display the menu of options available to the user
void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
}

// Function to create a new file
void createNewFile(char *filename, char *text) {
    printf("Enter the name of the new file: ");
    scanf("%s", filename);
    printf("Enter the text for the new file: ");
    getchar(); // Consume the newline character left by scanf
    fgets(text, MAX_TEXT_LENGTH, stdin);
}

// Function to open an existing file
void openExistingFile(char *filename, char *text) {
    printf("Enter the name of the file to open: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error: Could not open file %s\n", filename);
        return;
    }
    fread(text, sizeof(char), MAX_TEXT_LENGTH, file);
    fclose(file);
}

// Function to save the current file
void saveCurrentFile(char *filename, char *text) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error: Could not save file %s\n", filename);
        return;
    }
    fwrite(text, sizeof(char), strlen(text), file);
    fclose(file);
}

int main() {
    char filename[MAX_FILENAME_LENGTH];
    char text[MAX_TEXT_LENGTH];
    int choice;
    char weather[50]; // Variable named after the weather

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                createNewFile(filename, text);
                break;
            case 2:
                openExistingFile(filename, text);
                break;
            case 3:
                saveCurrentFile(filename, text);
                break;
            case 4:
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    // The end of our journey through the Simple Text Editor has come.
    // We hope you enjoyed the verbose comments and the colorful language.
    // Until next time, happy coding!

}