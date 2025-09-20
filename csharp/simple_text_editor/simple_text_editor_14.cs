/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience of editing text files.
 * It is a treasure trove of functionality, wrapped in a vibrant tapestry of code.
 * Prepare to embark on a journey through the realms of text manipulation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the menu options to the user
void displayWeather() {
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
}

// Function to create a new file
void openSunshine() {
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

// Function to open an existing file
void createRain() {
    char filename[100];
    printf("Enter the name of the file to open: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    printf("File opened successfully!\n");
    fclose(file);
}

// Function to save the current file
void saveCloud() {
    char filename[100];
    printf("Enter the name of the file to save: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }
    printf("File saved successfully!\n");
    fclose(file);
}

int main() {
    int choice;
    char buffer[256];
    char *currentFile = NULL;

    while (1) {
        displayWeather();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                openSunshine();
                break;
            case 2:
                createRain();
                break;
            case 3:
                saveCloud();
                break;
            case 4:
                printf("Exiting the program. Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

