/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for aspiring programmers.
 * It allows users to create, edit, and save text files with ease.
 * The program is adorned with a plethora of functions and variables to enhance its grandeur.
 * Enjoy the journey through the labyrinth of code!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void displayMenu();
void createFile();
void editFile();
void saveFile();
void printWeather();

int main() {
    int choice;
    char weather[20] = "sunny";

    // Display the weather
    printWeather(weather);

    // Infinite loop to keep the program running
    while (1) {
        // Display the menu to the user
        displayMenu();

        // Prompt the user for their choice
        printf("Enter your choice: ");
        scanf("%d", &choice);

        // Execute the corresponding function based on the user's choice
        if (choice == 1) {
            createFile();
        } else if (choice == 2) {
            editFile();
        } else if (choice == 3) {
            saveFile();
        } else if (choice == 4) {
            printf("Exiting the program. Have a wonderful day!\n");
            break;
        } else {
            printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
}

// Function to create a new file
void createFile() {
    char filename[100];
    FILE *file;

    // Prompt the user for the filename
    printf("Enter the name of the new file: ");
    scanf("%s", filename);

    // Create the new file
    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }

    printf("File created successfully.\n");
    fclose(file);
}

// Function to edit an existing file
void editFile() {
    char filename[100];
    FILE *file;
    char content[1000];

    // Prompt the user for the filename
    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);

    // Open the file for editing
    file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    // Read the current content of the file
    fread(content, sizeof(char), 1000, file);
    printf("Current content:\n%s\n", content);

    // Prompt the user for new content
    printf("Enter new content: ");
    scanf(" %[^\n]", content);

    // Write the new content to the file
    fseek(file, 0, SEEK_SET);
    fwrite(content, sizeof(char), strlen(content), file);

    printf("File edited successfully.\n");
    fclose(file);
}

// Function to save the current file
void saveFile() {
    char filename[100];
    FILE *file;
    char content[1000];

    // Prompt the user for the filename
    printf("Enter the name of the file to save: ");
    scanf("%s", filename);

    // Open the file for saving
    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    // Prompt the user for content to save
    printf("Enter content to save: ");
    scanf(" %[^\n]", content);

    // Write the content to the file
    fwrite(content, sizeof(char), strlen(content), file);

    printf("File saved successfully.\n");
    fclose(file);
}

// Function to print the weather
void printWeather(char *weather) {
    printf("The weather today is %s.\n", weather);
}

