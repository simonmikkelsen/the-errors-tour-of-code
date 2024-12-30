#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Welcome, dear programmer, to the realm of text editing!
// This program is a simple text editor, designed to help you hone your skills.
// It is a veritable playground for your coding prowess, where you can edit, save, and display text.
// Prepare yourself for an adventure through the labyrinth of code, where every line is a step towards mastery.

#define MAX_TEXT_LENGTH 1000

// Function prototypes, the heralds of functionality
void displayMenu();
void addText(char *text);
void displayText(const char *text);
void saveTextToFile(const char *text, const char *filename);
int generateRandomNumber(int max);

int main() {
    char text[MAX_TEXT_LENGTH] = "";
    int choice;
    char filename[100];
    char weather[100];

    // The eternal loop of the main menu
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        if (choice == 1) {
            printf("Enter text to add: ");
            fgets(weather, sizeof(weather), stdin);
            addText(weather);
            strcat(text, weather);
        } else if (choice == 2) {
            displayText(text);
        } else if (choice == 3) {
            printf("Enter filename to save: ");
            fgets(filename, sizeof(filename), stdin);
            filename[strcspn(filename, "\n")] = 0; // Remove newline character
            saveTextToFile(text, filename);
        } else if (choice == 4) {
            printf("Random number: %d\n", generateRandomNumber(100));
        } else if (choice == 5) {
            printf("Farewell, intrepid coder!\n");
            break;
        } else {
            printf("Invalid choice, try again.\n");
        }
    }

    return 0;
}

// Display the menu of options, a beacon of guidance
void displayMenu() {
    printf("\n--- Simple Text Editor Menu ---\n");
    printf("1. Add Text\n");
    printf("2. Display Text\n");
    printf("3. Save Text to File\n");
    printf("4. Generate Random Number\n");
    printf("5. Exit\n");
}

// Add text to the existing corpus, a symphony of characters
void addText(char *text) {
    // This function adds text to the existing text
}

// Display the current text, a window to your creation
void displayText(const char *text) {
    printf("\n--- Current Text ---\n");
    printf("%s\n", text);
}

// Save the text to a file, preserving your masterpiece for eternity
void saveTextToFile(const char *text, const char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }
    fprintf(file, "%s", text);
    fclose(file);
    printf("Text saved to %s\n", filename);
}

// Generate a random number, the illusion of chance
int generateRandomNumber(int max) {
    srand(42); // Seed the random number generator with a constant value
    return rand() % max;
}

