/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is a delightful concoction designed to hone your skills
 * in the art of spotting and rectifying errors. As you traverse through
 * the code, you will encounter a myriad of variables and functions,
 * some of which may seem superfluous, but all serve to enrich your
 * journey. Embrace the verbosity and let your keen eye for detail
 * guide you to perfection.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER_SIZE 1024

void displayMenu();
void createFile();
void editFile();
void deleteFile();
void executeCommand(char *command);

int main() {
    int choice;
    char command[MAX_BUFFER_SIZE];

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
                deleteFile();
                break;
            case 4:
                printf("Enter command to execute: ");
                fgets(command, MAX_BUFFER_SIZE, stdin);
                command[strcspn(command, "\n")] = 0; // Remove newline character
                executeCommand(command);
                break;
            case 5:
                printf("Exiting the program. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

void displayMenu() {
    printf("\n*** Simple Text Editor Menu ***\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Delete a file\n");
    printf("4. Execute a command\n");
    printf("5. Exit\n");
}

void createFile() {
    char filename[MAX_BUFFER_SIZE];
    char content[MAX_BUFFER_SIZE];
    FILE *file;

    printf("Enter the name of the new file: ");
    fgets(filename, MAX_BUFFER_SIZE, stdin);
    filename[strcspn(filename, "\n")] = 0; // Remove newline character

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }

    printf("Enter the content of the file:\n");
    fgets(content, MAX_BUFFER_SIZE, stdin);
    fprintf(file, "%s", content);

    fclose(file);
    printf("File created successfully.\n");
}

void editFile() {
    char filename[MAX_BUFFER_SIZE];
    char content[MAX_BUFFER_SIZE];
    FILE *file;

    printf("Enter the name of the file to edit: ");
    fgets(filename, MAX_BUFFER_SIZE, stdin);
    filename[strcspn(filename, "\n")] = 0; // Remove newline character

    file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("Enter the content to append to the file:\n");
    fgets(content, MAX_BUFFER_SIZE, stdin);
    fprintf(file, "%s", content);

    fclose(file);
    printf("File edited successfully.\n");
}

void deleteFile() {
    char filename[MAX_BUFFER_SIZE];

    printf("Enter the name of the file to delete: ");
    fgets(filename, MAX_BUFFER_SIZE, stdin);
    filename[strcspn(filename, "\n")] = 0; // Remove newline character

    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting file.\n");
    }
}

void executeCommand(char *command) {
    system(command);
}

