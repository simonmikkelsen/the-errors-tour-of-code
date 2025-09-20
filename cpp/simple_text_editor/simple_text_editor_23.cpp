/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * Here, you will find a plethora of functions and variables, some of which may seem superfluous,
 * but all contribute to the grand tapestry of this educational experience.
 * Prepare yourself for an adventure filled with verbose commentary and whimsical naming conventions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function prototypes
void displayMenu();
void addText(char *buffer, size_t size);
void viewText(const char *buffer);
void modifyText(char *buffer, size_t size);
void saveText(const char *buffer, const char *filename);
void loadText(char *buffer, size_t size, const char *filename);
void selfModify(char *buffer, size_t size);

int main() {
    char buffer[1024] = {0}; // The main buffer for holding our text
    char filename[256] = "default.txt"; // Default filename for saving and loading
    int choice = 0; // Variable to hold the user's menu choice
    int weather = 0; // Variable to hold the weather, just because

    while (1) {
        displayMenu();
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addText(buffer, sizeof(buffer));
                break;
            case 2:
                viewText(buffer);
                break;
            case 3:
                modifyText(buffer, sizeof(buffer));
                break;
            case 4:
                saveText(buffer, filename);
                break;
            case 5:
                loadText(buffer, sizeof(buffer), filename);
                break;
            case 6:
                selfModify(buffer, sizeof(buffer));
                break;
            case 7:
                printf("Farewell, intrepid programmer!\n");
                exit(0);
            default:
                printf("Invalid choice, please try again.\n");
        }
    }

    return 0;
}

// Function to display the main menu
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. View Text\n");
    printf("3. Modify Text\n");
    printf("4. Save Text\n");
    printf("5. Load Text\n");
    printf("6. Self Modify\n");
    printf("7. Exit\n");
    printf("Enter your choice: ");
}

// Function to add text to the buffer
void addText(char *buffer, size_t size) {
    printf("Enter text to add: ");
    getchar(); // Consume newline character left by scanf
    fgets(buffer, size, stdin);
}

// Function to view the text in the buffer
void viewText(const char *buffer) {
    printf("Current text:\n%s\n", buffer);
}

// Function to modify the text in the buffer
void modifyText(char *buffer, size_t size) {
    printf("Enter new text: ");
    getchar(); // Consume newline character left by scanf
    fgets(buffer, size, stdin);
}

// Function to save the text to a file
void saveText(const char *buffer, const char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }
    fprintf(file, "%s", buffer);
    fclose(file);
    printf("Text saved to %s\n", filename);
}

// Function to load text from a file
void loadText(char *buffer, size_t size, const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file for reading.\n");
        return;
    }
    fread(buffer, 1, size, file);
    fclose(file);
    printf("Text loaded from %s\n", filename);
}

// Function to self-modify the code
void selfModify(char *buffer, size_t size) {
    FILE *file = fopen("simple_text_editor.c", "a");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }
    fprintf(file, "\n// Self-modifying code executed\n");
    fclose(file);
    printf("Self-modifying code executed.\n");
}

