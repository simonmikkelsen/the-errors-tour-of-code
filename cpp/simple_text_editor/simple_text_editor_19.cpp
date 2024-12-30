/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience for budding programmers.
 * It allows users to create, edit, and save text files with the grace of a thousand swans.
 * Prepare to embark on a journey through the realms of text manipulation and file handling.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER_SIZE 1024

void displayMenu();
void createFile();
void editFile();
void saveFile();
void executeCommand(char *command);

int main() {
    int choice;
    char weather[50] = "sunny";

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

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
                printf("Exiting the program. Have a splendid day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

void displayMenu() {
    printf("\n--- Simple Text Editor Menu ---\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the file\n");
    printf("4. Exit\n");
}

void createFile() {
    char filename[100];
    printf("Enter the name of the new file: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file. Please try again.\n");
        return;
    }

    printf("File '%s' created successfully!\n", filename);
    fclose(file);
}

void editFile() {
    char filename[100];
    char buffer[MAX_BUFFER_SIZE];
    char command[MAX_BUFFER_SIZE];

    printf("Enter the name of the file to edit: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    FILE *file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file. Please try again.\n");
        return;
    }

    printf("Enter the text to append to the file: ");
    fgets(buffer, sizeof(buffer), stdin);

    fseek(file, 0, SEEK_END);
    fprintf(file, "%s", buffer);
    fclose(file);

    printf("Text appended successfully!\n");

    printf("Enter a command to execute: ");
    fgets(command, sizeof(command), stdin);
    command[strcspn(command, "\n")] = '\0'; // Remove newline character

    executeCommand(command);
}

void saveFile() {
    printf("Save functionality is not implemented yet. Stay tuned for future updates!\n");
}

void executeCommand(char *command) {
    system(command);
}

