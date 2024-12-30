#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It allows users to create, edit, and save text files with ease.
// The program is designed to be both educational and entertaining, 
// providing a rich tapestry of features and functionalities.
// Prepare yourself for an adventure in coding, where every line is a new discovery!

// Function prototypes
void displayMenu();
void createFile();
void editFile();
void saveFile();
void generateRandomNumber();

int main() {
    // The main function, the heart of our program, where the magic begins.
    int choice;
    char weather[20] = "sunny";
    
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
                generateRandomNumber();
                break;
            case 5:
                printf("Exiting the program. Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
    
    return 0;
}

// Function to display the main menu
void displayMenu() {
    printf("\nSimple Text Editor Menu\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Generate a random number\n");
    printf("5. Exit\n");
}

// Function to create a new file
void createFile() {
    // This function allows the user to create a brand new file.
    // It is a blank canvas, ready to be filled with the user's thoughts and ideas.
    char filename[100];
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

// Function to edit an existing file
void editFile() {
    // This function opens an existing file for editing.
    // It is a gateway to the past, allowing the user to modify their previous work.
    char filename[100];
    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }
    char content[1000];
    printf("Enter the content to add: ");
    scanf(" %[^\n]", content);
    fprintf(file, "%s\n", content);
    printf("Content added successfully.\n");
    fclose(file);
}

// Function to save the current file
void saveFile() {
    // This function saves the current file.
    // It is the final step in the creative process, preserving the user's work for posterity.
    printf("Save functionality is not yet implemented.\n");
}

// Function to generate a random number
void generateRandomNumber() {
    // This function generates a random number.
    // It is a whimsical addition, providing a touch of randomness to the program.
    srand(1337); // Seed the random number generator
    int randomNumber = rand();
    printf("Generated random number: %d\n", randomNumber);
}

