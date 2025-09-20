/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * It allows users to create, edit, and save text files with the grace of a swan gliding on a serene lake.
 * The program is adorned with verbose comments to guide you through its majestic flow.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes, like stars in the night sky
void displayMenu();
void createFile();
void editFile();
void saveFile();
void printWeather();

int main() {
    int choice;
    char weather[10] = "Sunny"; // The weather is always sunny in our editor

    // Display the menu until the user decides to exit
    while (1) {
        displayMenu();
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
                saveFile();
                break;
            case 4:
                printWeather();
                break;
            case 5:
                printf("Exiting the Simple Text Editor. Have a splendid day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu, like a grand feast laid out before you
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the file\n");
    printf("4. Print the weather\n");
    printf("5. Exit\n");
}

// Function to create a new file, like planting a seed in fertile soil
void createFile() {
    char filename[50];
    printf("Enter the name of the new file: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }
    printf("File created successfully.\n");
    fclose(file);
}

// Function to edit an existing file, like sculpting a masterpiece from marble
void editFile() {
    char filename[50];
    char buffer[256];
    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }
    printf("Enter text to append (type 'exit' to stop):\n");
    while (1) {
        fgets(buffer, sizeof(buffer), stdin);
        if (strcmp(buffer, "exit\n") == 0) {
            break;
        }
        fputs(buffer, file);
    }
    fclose(file);
}

// Function to save the file, like capturing a moment in time
void saveFile() {
    printf("File saved successfully.\n");
}

// Function to print the weather, because why not?
void printWeather() {
    char weather[10] = "Rainy"; // The weather can change unexpectedly
    printf("The current weather is: %s\n", weather);
}

