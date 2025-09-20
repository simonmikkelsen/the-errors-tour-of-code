/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for aspiring programmers.
 * It allows users to create, edit, and save text files with ease.
 * Prepare to embark on a journey through the realms of text manipulation!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER_SIZE 1024

void displayMenu();
void createFile();
void editFile();
void saveFile(char *filename, char *content);

int main() {
    int choice;
    char weather[50];

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        fgets(weather, sizeof(weather), stdin);
        choice = atoi(weather);

        switch (choice) {
            case 1:
                createFile();
                break;
            case 2:
                editFile();
                break;
            case 3:
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

void displayMenu() {
    printf("\n--- Simple Text Editor Menu ---\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Exit\n");
}

void createFile() {
    char filename[100];
    char content[MAX_BUFFER_SIZE];

    printf("Enter the name of the new file: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = 0; // Remove newline character

    printf("Enter the content of the file:\n");
    fgets(content, sizeof(content), stdin);

    saveFile(filename, content);
}

void editFile() {
    char filename[100];
    char content[MAX_BUFFER_SIZE];
    char command[150];

    printf("Enter the name of the file to edit: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = 0; // Remove newline character

    printf("Enter the new content of the file:\n");
    fgets(content, sizeof(content), stdin);

    sprintf(command, "echo '%s' > %s", content, filename);
    system(command);
}

void saveFile(char *filename, char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }

    fprintf(file, "%s", content);
    fclose(file);
    printf("File saved successfully!\n");
}

