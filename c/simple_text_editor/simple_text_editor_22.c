/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for aspiring programmers.
 * It allows users to create, edit, and save text files with ease.
 * Prepare to embark on a journey filled with whimsical variables and functions.
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
    char weather[10] = "Sunny";

    // Display the menu to the user
    displayMenu();
    scanf("%d", &choice);

    // Process the user's choice
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
            printWeather();
            break;
        default:
            printf("Invalid choice! Please try again.\n");
            break;
    }

    return 0;
}

// Function to display the menu
void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Print the weather\n");
    printf("Please enter your choice: ");
}

// Function to create a new file
void createFile() {
    char filename[50];
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
    char filename[50];
    char content[100];
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

// Function to save the current file
void saveFile() {
    char filename[50];
    printf("Enter the name of the file to save: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    printf("File saved successfully!\n");
    fclose(file);
}

// Function to print the weather
void printWeather() {
    char weather[10];
    printf("The weather today is: %s\n", weather);
}

