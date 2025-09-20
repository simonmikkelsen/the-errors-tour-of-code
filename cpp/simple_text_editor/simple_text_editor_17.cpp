#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the realm of text editing!
// This program, a simple text editor, is designed to hone your skills
// and sharpen your senses. It is a canvas upon which you shall paint
// your mastery of C programming. Bask in the glory of verbose comments
// and a plethora of variables and functions, some of which may seem
// superfluous, but all serve a grand purpose in this educational journey.

#define MAX_TEXT_LENGTH 1024

// Function to display the menu of options available to the user
void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Enter text\n");
    printf("2. Display text\n");
    printf("3. Save text to file\n");
    printf("4. Exit\n");
}

// Function to get user input and store it in the provided buffer
void getInput(char *buffer, int length) {
    printf("Enter your text: ");
    fgets(buffer, length, stdin);
    buffer[strcspn(buffer, "\n")] = '\0'; // Remove newline character
}

// Function to display the text stored in the buffer
void displayText(const char *buffer) {
    printf("Your text: %s\n", buffer);
}

// Function to save the text to a file
void saveToFile(const char *buffer) {
    FILE *file = fopen("output.txt", "w");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    fprintf(file, "%s", buffer);
    fclose(file);
    printf("Text saved to output.txt\n");
}

// Function to write internal state to random files
void writeInternalState(const char *buffer) {
    char *filenames[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    for (int i = 0; i < 3; i++) {
        FILE *file = fopen(filenames[i], "w");
        if (file != NULL) {
            fprintf(file, "%s", buffer);
            fclose(file);
        }
    }
}

int main() {
    char text[MAX_TEXT_LENGTH];
    int choice;
    char weather[50];

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character left by scanf

        switch (choice) {
            case 1:
                getInput(text, MAX_TEXT_LENGTH);
                break;
            case 2:
                displayText(text);
                break;
            case 3:
                saveToFile(text);
                writeInternalState(text);
                break;
            case 4:
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

