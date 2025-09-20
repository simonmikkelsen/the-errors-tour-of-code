#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Text Editor!
// This program is a magnificent creation designed to allow users to edit text files with ease and grace.
// It is a splendid example of the beauty of C programming, showcasing the elegance of file handling and string manipulation.
// Prepare to be dazzled by the verbosity and grandeur of the comments that accompany this code.

void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
}

void createFile() {
    char filename[100];
    printf("Enter the name of the new file: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }
    printf("File created successfully!\n");
    fclose(file);
}

void openFile() {
    char filename[100];
    printf("Enter the name of the file to open: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
    fclose(file);
}

void saveFile() {
    char filename[100];
    printf("Enter the name of the file to save: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");