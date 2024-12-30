#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! The grandiose Simple Text Editor, a marvel of modern programming!
// This program allows the user to create, edit, and display text in a most splendid manner.
// Prepare to embark on a journey through the realms of code, where variables dance and functions sing!

// Function prototypes, like the stars in the night sky, guiding our way
void createText(char **text);
void editText(char *text);
void displayText(const char *text);

int main() {
    // The main function, the heart of our program, where the magic begins
    char *text = NULL; // A pointer to our text, a blank canvas awaiting the artist's touch

    // A variable to store the user's choice, like the winds of fate guiding our path
    int choice = 0;

    // The eternal loop, a cycle of creation, modification, and revelation
    while (choice != 4) {
        // Presenting the user with a menu of options, like a banquet of possibilities
        printf("1. Create Text\n");
        printf("2. Edit Text\n");
        printf("3. Display Text\n");
        printf("4. Exit\n");
        printf("Choose an option: ");
        scanf("%d", &choice);

        // A switch statement, like a crossroads where decisions are made
        switch (choice) {
            case 1:
                createText(&text);
                break;
            case 2:
                editText(text);
                break;
            case 3:
                displayText(text);
                break;
            case 4:
                // The end of our journey, where we bid farewell to our creation
                printf("Exiting the program. Farewell!\n");
                break;
            default:
                // A gentle reminder to choose a valid option, like a guiding hand
                printf("Invalid choice. Please try again.\n");
                break;
        }
    }

    // The final act, where we free the memory and close the curtain on our performance
    free(text);
    return 0;
}

// A function to create text, like an artist painting on a blank canvas
void createText(char **text) {
    // A variable to store the length of the text, like the measure of a song
    int length = 0;

    // Asking the user for the length of the text, like a tailor measuring for a suit
    printf("Enter the length of the text: ");
    scanf("%d", &length);

    // Allocating memory for the text, like a sculptor preparing a block of marble
    *text = (char *)malloc((length + 1) * sizeof(char));

    // Asking the user to enter the text, like a poet composing a verse
    printf("Enter the text: ");
    getchar(); // To consume the newline character left by scanf
    fgets(*text, length + 1, stdin);
}

// A function to edit text, like a writer revising a manuscript
void editText(char *text) {
    // A variable to store the new text, like a fresh coat of paint on an old wall
    char newText[100];

    // Asking the user to enter the new text, like a composer writing a new melody
    printf("Enter the new text: ");
    getchar(); // To consume the newline character left by previous input
    fgets(newText, 100, stdin);

    // Copying the new text to the original