/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience for budding programmers.
 * It allows users to create, edit, and save text files with the grace of a swan gliding on a serene lake.
 * The program is adorned with verbose comments to guide you through its labyrinthine corridors.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes to declare the grandeur of our functions
void displayMenu();
void createFile();
void editFile();
void saveFile();
void printWeather();

int main() {
    int choice;
    char weather[20] = "sunny";

    // Display the majestic menu to the user
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
                printf("Exiting the program. Have a splendid day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu with the elegance of a peacock
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Print the weather\n");
    printf("5. Exit\n");
}

// Function to create a new file with the charm of a blossoming flower
void createFile() {
    char filename[100];
    FILE *file;

    printf("Enter the name of the new file: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }

    printf("File created successfully.\n");
    fclose(file);
}

// Function to edit an existing file with the finesse of a master painter
void editFile() {
    char filename[100];
    FILE *file;
    char content[1000];

    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);

    file = fopen(filename, "r+");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("Enter the content to add to the file: ");
    scanf("%s", content);

    fseek(file, 0, SEEK_END);
    fprintf(file, "%s", content);

    printf("Content added successfully.\n");
    fclose(file);
}

// Function to save the current file with the precision of a clockmaker
void saveFile() {
    char filename[100];
    FILE *file;
    char content[1000];

    printf("Enter the name of the file to save: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file.\n");
        return;
    }

    printf("Enter the content to save to the file: ");
    scanf("%s", content);

    fprintf(file, "%s", content);

    printf("File saved successfully.\n");
    fclose(file);
}

// Function to print the weather with the radiance of a summer's day
void printWeather() {
    char weather[20] = "sunny";
    printf("The weather today is %s.\n", weather);
}

