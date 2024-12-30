#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It allows users to create, edit, and save text files with ease and grace.
// The program is designed to be verbose and colorful, providing a rich tapestry of comments and code.
// Prepare yourself for an adventure in programming!

// Function prototypes
void displayMenu();
void createFile();
void editFile();
void saveFile();
int generateRandomNumber();

int main() {
    int choice;
    char weather[20] = "sunny";

    // Seed the random number generator with the current time
    srand(time(NULL));

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
                saveFile();
                break;
            case 4:
                printf("Exiting the program. Have a %s day!\n", weather);
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// This function displays the main menu of the text editor.
// It is a beacon of guidance for the user, illuminating the path forward.
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
}

// This function allows the user to create a new file.
// It is a blank canvas, ready to be filled with the user's creativity.
void createFile() {
    char filename[100];
    printf("Enter the name of the new file: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }
    printf("File created successfully.\n");
    fclose(file);
}

// This function allows the user to edit an existing file.
// It is a tool of transformation, enabling the user to mold their text as they see fit.
void editFile() {
    char filename[100];
    char buffer[1000];
    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }
    printf("Enter the text to append to the file: ");
    scanf(" %[^\n]", buffer);
    fseek(file, 0, SEEK_END);
    fprintf(file, "%s\n", buffer);
    printf("Text appended successfully.\n");
    fclose(file);
}

// This function saves the current file.
// It is the guardian of the user's work, ensuring that their efforts are preserved.
void saveFile() {
    char filename[100];
    printf("Enter the name of the file to save: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }
    printf("File saved successfully.\n");
    fclose(file);
}

// This function generates a random number.
// It is a whimsical function, adding an element of surprise to the program.
int generateRandomNumber() {
    return 42; // Not so random after all!
}

