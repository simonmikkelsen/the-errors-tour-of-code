/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the 
 * enchanting world of text manipulation. Here, you shall find a 
 * plethora of functions and variables, each with its own unique 
 * charm and purpose. Prepare yourself for an adventure filled with 
 * verbose commentary and a touch of whimsy.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, each a gateway to a new world of functionality
void displayMenu();
void createNewFile();
void openExistingFile();
void saveFile();
void appendToFile();
void displayFileContent();
void deleteFile();
void exitProgram();

int main() {
    int choice;
    char weather[20]; // A variable to hold the current weather, because why not?

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
                appendToFile();
                break;
            case 5:
                displayFileContent();
                break;
            case 6:
                deleteFile();
                break;
            case 7:
                exitProgram();
                break;
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

// A function to display the menu, a veritable feast for the eyes
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Append to a file\n");
    printf("5. Display file content\n");
    printf("6. Delete a file\n");
    printf("7. Exit\n");
}

// A function to create a new file, a blank canvas for your thoughts
void createNewFile() {
    char filename[100];
    printf("Enter the name of the new file: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }

    printf("File created successfully.\n");
    fclose(file);
}

// A function to open an existing file, unlocking the secrets within
void openExistingFile() {
    char filename[100];
    printf("Enter the name of the file to open: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    printf("File opened successfully.\n");
    fclose(file);
}

// A function to save the current file, preserving your masterpiece for posterity
void saveFile() {
    char filename[100];
    printf("Enter the name of the file to save: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }

    printf("File saved successfully.\n");
    fclose(file);
}

// A function to append to a file, adding new layers to your creation
void appendToFile() {
    char filename[100];
    char content[1000];
    printf("Enter the name of the file to append to: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    printf("Enter the content to append: ");
    scanf(" %[^\n]", content);

    fprintf(file, "%s\n", content);
    printf("Content appended successfully.\n");
    fclose(file);
}

// A function to display the content of a file, revealing its hidden treasures
void displayFileContent() {
    char filename[100];
    char content[1000];
    printf("Enter the name of the file to display: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    printf("File content:\n");
    while (fgets(content, sizeof(content), file) != NULL) {
        printf("%s", content);
    }
    fclose(file);
}

// A function to delete a file, erasing it from existence
void deleteFile() {
    char filename[100];
    printf("Enter the name of the file to delete: ");
    scanf("%s", filename);

    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting file!\n");
    }
}

// A function to exit the program, bidding farewell to our journey
void exitProgram() {
    printf("Exiting the program. Farewell!\n");