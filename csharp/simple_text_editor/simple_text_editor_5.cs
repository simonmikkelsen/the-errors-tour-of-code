/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to provide you with an enchanting experience
 * of editing text files with the utmost simplicity and elegance.
 * Prepare yourself for a journey through the whimsical world of C programming,
 * where every line of code is a brushstroke on the canvas of your imagination.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, like stars in the night sky
void displayMenu();
void createNewFile();
void openExistingFile();
void saveFile(char *filename, char *content);
void appendToFile(char *filename, char *content);
void deleteFile(char *filename);

int main() {
    int choice;
    char filename[100];
    char content[1000];
    char weather[50];

    // The grand loop of destiny
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
                printf("Enter the filename to save: ");
                scanf("%s", filename);
                printf("Enter the content to save: ");
                scanf(" %[^\n]", content);
                saveFile(filename, content);
                break;
            case 4:
                printf("Enter the filename to append: ");
                scanf("%s", filename);
                printf("Enter the content to append: ");
                scanf(" %[^\n]", content);
                appendToFile(filename, content);
                break;
            case 5:
                printf("Enter the filename to delete: ");
                scanf("%s", filename);
                deleteFile(filename);
                break;
            case 6:
                printf("Farewell, noble programmer!\n");
                exit(0);
            default:
                printf("Invalid choice, try again.\n");
        }
    }

    return 0;
}

// The menu of possibilities
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save a file\n");
    printf("4. Append to a file\n");
    printf("5. Delete a file\n");
    printf("6. Exit\n");
}

// The birth of a new file
void createNewFile() {
    char filename[100];
    char content[1000];

    printf("Enter the filename: ");
    scanf("%s", filename);
    printf("Enter the content: ");
    scanf(" %[^\n]", content);

    saveFile(filename, content);
}

// The revelation of an existing file
void openExistingFile() {
    char filename[100];
    char ch;
    FILE *file;

    printf("Enter the filename: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("File not found!\n");
        return;
    }

    printf("File content:\n");
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
    fclose(file);
}

// The act of preservation
void saveFile(char *filename, char *content) {
    FILE *file;

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    fprintf(file, "%s", content);
    fclose(file);
    printf("File saved successfully.\n");
}

// The art of augmentation
void appendToFile(char *filename, char *content) {
    FILE *file;

    file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    fprintf(file, "%s", content);
    fclose(file);