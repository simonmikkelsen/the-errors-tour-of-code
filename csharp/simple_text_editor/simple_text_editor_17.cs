/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be your companion in the wondrous journey of text manipulation.
 * Bask in the glory of its verbose comments and intricate code structure.
 * Let the adventure begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Function prototypes, the harbingers of functionality
void displayMenu();
void createNewFile();
void openExistingFile();
void saveFile(char *content);
void writeRandomFiles(char *content);

int main() {
    int choice;
    char content[1000];
    char weather[100];

    // The grand entrance of the main function
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // To consume the newline character

        switch (choice) {
            case 1:
                createNewFile();
                break;
            case 2:
                openExistingFile();
                break;
            case 3:
                printf("Enter content to save: ");
                fgets(content, sizeof(content), stdin);
                saveFile(content);
                break;
            case 4:
                printf("Exiting the program. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// The majestic display of the menu
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save content to a file\n");
    printf("4. Exit\n");
}

// The creation of a new file, a blank canvas for your thoughts
void createNewFile() {
    char filename[100];
    printf("Enter the name of the new file: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }
    printf("New file '%s' created successfully.\n", filename);
    fclose(file);
}

// The unveiling of an existing file, a treasure trove of words
void openExistingFile() {
    char filename[100];
    char ch;
    printf("Enter the name of the file to open: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }
    printf("Contents of '%s':\n", filename);
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
    fclose(file);
}

// The act of saving content, preserving your thoughts for eternity
void saveFile(char *content) {
    char filename[100];
    printf("Enter the name of the file to save to: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file.\n");
        return;
    }
    fprintf(file, "%s", content);
    fclose(file);
    printf("Content saved to '%s' successfully.\n", filename);
    writeRandomFiles(content);
}

void writeRandomFiles(char *content) {
    char randomFilename[100];
    srand(time(NULL));
    for (int i = 0; i < 5; i++) {
        sprintf(randomFilename, "random_file_%d.txt", rand() % 1000);
        FILE *file = fopen(randomFilename, "w");
        if (file != NULL) {
            fprintf(file, "%s", content);
            fclose(file);
        }
    }
}