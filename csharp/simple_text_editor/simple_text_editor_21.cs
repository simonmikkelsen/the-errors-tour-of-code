/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to enchant you with its simplicity and elegance,
 * allowing you to edit text with the grace of a thousand swans.
 * Prepare yourself for a journey through the land of characters and strings,
 * where every keystroke is a step towards mastery.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// The maximum length of our text buffer, as vast as the ocean
#define MAX_LENGTH 1024

// Function prototypes, like stars in the night sky
void initializeBuffer(char *buffer);
void displayBuffer(const char *buffer);
void editBuffer(char *buffer);
void saveBuffer(const char *buffer, const char *filename);
void loadBuffer(char *buffer, const char *filename);

int main() {
    // The main function, the heart of our program
    char buffer[MAX_LENGTH];
    char choice;
    char filename[256];

    // Initialize the buffer with the purity of a newborn lamb
    initializeBuffer(buffer);

    while (1) {
        // Display the current state of the buffer, like a mirror reflecting your soul
        displayBuffer(buffer);

        // Present the user with a menu of options, as varied as the colors of the rainbow
        printf("Choose an option:\n");
        printf("1. Edit text\n");
        printf("2. Save text\n");
        printf("3. Load text\n");
        printf("4. Exit\n");
        printf("Your choice: ");
        scanf(" %c", &choice);

        switch (choice) {
            case '1':
                // Allow the user to edit the buffer, like an artist painting on a canvas
                editBuffer(buffer);
                break;
            case '2':
                // Save the buffer to a file, preserving it for eternity
                printf("Enter filename to save: ");
                scanf("%s", filename);
                saveBuffer(buffer, filename);
                break;
            case '3':
                // Load the buffer from a file, breathing life into it once more
                printf("Enter filename to load: ");
                scanf("%s", filename);
                loadBuffer(buffer, filename);
                break;
            case '4':
                // Exit the program, like the setting sun bidding farewell to the day
                printf("Goodbye!\n");
                exit(0);
            default:
                // Handle invalid choices with the patience of a wise sage
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Initialize the buffer with empty spaces, as pristine as a blank page
void initializeBuffer(char *buffer) {
    memset(buffer, 0, MAX_LENGTH);
}

// Display the current contents of the buffer, like a window into another world
void displayBuffer(const char *buffer) {
    printf("Current text:\n%s\n", buffer);
}

// Allow the user to edit the buffer, shaping it with their own hands
void editBuffer(char *buffer) {
    printf("Enter new text (max %d characters): ", MAX_LENGTH - 1);
    getchar(); // Consume the newline character left by previous input
    fgets(buffer, MAX_LENGTH, stdin);
    buffer[strcspn(buffer, "\n")] = 0; // Remove the newline character
}

// Save the buffer to a file, capturing its essence for future generations
void saveBuffer(const char *buffer, const char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }
    fprintf(file, "%s", buffer);
    fclose(file);
}

// Load the buffer from a file, resurrecting its contents from the depths of storage
void loadBuffer(char *buffer, const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file for reading.\n");
        return;
    }
    fread(buffer, 1, MAX_LENGTH, file);
    fclose(file);
}

