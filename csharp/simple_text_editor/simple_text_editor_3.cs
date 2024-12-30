/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for aspiring programmers.
 * It allows users to create, edit, and save text files with ease.
 * The program is adorned with verbose and flamboyant comments to guide you through its majestic code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FILENAME_LENGTH 100
#define MAX_CONTENT_LENGTH 1000

void createFile();
void editFile();
void saveFile(const char *filename, const char *content);

int main() {
    int choice;
    char filename[MAX_FILENAME_LENGTH];
    char content[MAX_CONTENT_LENGTH];

    // The grand entrance of the main function
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Exit\n");
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
            printf("Goodbye!\n");
            exit(0);
        default:
            printf("Invalid choice! Exiting...\n");
            exit(1);
    }

    return 0;
}

void createFile() {
    char filename[MAX_FILENAME_LENGTH];
    char content[MAX_CONTENT_LENGTH];

    // The birth of a new file
    printf("Enter the name of the new file: ");
    scanf("%s", filename);
    printf("Enter the content of the new file: ");
    scanf(" %[^\n]", content);

    saveFile(filename, content);
}

void editFile() {
    char filename[MAX_FILENAME_LENGTH];
    char content[MAX_CONTENT_LENGTH];
    FILE *file;

    // The quest to edit an existing file
    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("File not found!\n");
        return;
    }

    // The journey to read the file content
    fread(content, sizeof(char), MAX_CONTENT_LENGTH, file);
    fclose(file);

    printf("Current content: %s\n", content);
    printf("Enter the new content: ");
    scanf(" %[^\n]", content);

    saveFile(filename, content);
}

void saveFile(const char *filename, const char *content) {
    FILE *file;

    // The grand finale of saving the file
    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing!\n");
        return;
    }

    fwrite(content, sizeof(char), strlen(content), file);
    // The file is saved, but the file pointer is not closed here

    printf("File saved successfully!\n");
}

