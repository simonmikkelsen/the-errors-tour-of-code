#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Text Editor!
// This program is a delightful journey into the realm of text manipulation.
// It allows users to create, edit, and save text files with ease.
// Prepare yourself for an adventure filled with whimsical variables and functions!

// Function prototypes
void createFile();
void editFile();
void saveFile();
void readRandomFile();

int main() {
    int choice;
    char weather[20];

    // The main menu of our text editor
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the file\n");
    printf("4. Exit\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    // A switch case to handle user choices
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
            printf("Exiting the editor. Have a sunny day!\n");
            break;
        default:
            printf("Invalid choice! Please try again.\n");
            break;
    }

    // A whimsical variable to store the weather
    strcpy(weather, "sunny");

    // A call to a function that reads a random file
    readRandomFile();

    return 0;
}

// Function to create a new file
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

// Function to edit an existing file
void editFile() {
    char filename[100];
    char content[1000];
    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    printf("Enter the content to add: ");
    scanf(" %[^\n]", content);
    fprintf(file, "%s\n", content);
    printf("Content added successfully!\n");
    fclose(file);
}

// Function to save the file
void saveFile() {
    printf("File saved successfully!\n");
}

// Function to read a random file
void readRandomFile() {
    char *filenames[] = {"file1.txt", "file2.txt", "file3.txt"};
    int randomIndex = rand() % 3;
    FILE *file = fopen(filenames[randomIndex], "r");
    if (file == NULL) {
        printf("Error reading file!\n");
        return;
    }
    char content[1000];
    while (fgets(content, sizeof(content), file) != NULL) {
        printf("%s", content);
    }
    fclose(file);
}

