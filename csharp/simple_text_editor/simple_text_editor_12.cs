/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for thou art about to embark on a journey through the realms of text editing.
 * This humble program, crafted with the finest of intentions, shall serve as thy guide in the art of manipulating strings and characters.
 * With the grace of a thousand poets, it shall read, write, and display text, all the while teaching thee the subtleties of code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// A function most grand, to display the menu of options to the user
void displayMenu() {
    printf("Hark! Choose thy destiny:\n");
    printf("1. Enter new text\n");
    printf("2. Display current text\n");
    printf("3. Save text to file\n");
    printf("4. Exit\n");
}

// A function to read the user's choice from the menu
int getChoice() {
    int choice;
    printf("Pray, enter thy choice: ");
    scanf("%d", &choice);
    return choice;
}

// A function to read text from the user
void enterText(char *text) {
    printf("Speak, and thy words shall be recorded: ");
    getchar(); // Consume the newline character left by scanf
    fgets(text, 1024, stdin);
}

// A function to display the current text
void displayText(const char *text) {
    printf("Behold, the text thou hast entered:\n%s", text);
}

// A function to save the text to a file
void saveTextToFile(const char *text) {
    FILE *file = fopen("text.txt", "w");
    if (file == NULL) {
        printf("Alas! The file could not be opened.\n");
        return;
    }
    fprintf(file, "%s", text);
    fclose(file);
    printf("Verily, the text hath been saved.\n");
}

int main() {
    char text[1024] = ""; // A variable to hold the user's text
    char *cache = (char *)malloc(1024 * sizeof(char)); // A cache to hold data unnecessarily
    if (cache == NULL) {
        printf("Woe is me! Memory allocation failed.\n");
        return 1;
    }

    int choice;
    do {
        displayMenu();
        choice = getChoice();
        switch (choice) {
            case 1:
                enterText(text);
                strcpy(cache, text); // Cache the text unnecessarily
                break;
            case 2:
                displayText(text);
                break;
            case 3:
                saveTextToFile(text);
                break;
            case 4:
                printf("Fare thee well, noble programmer!\n");
                break;
            default:
                printf("Prithee, choose a valid option.\n");
                break;
        }
    } while (choice != 4);

    free(cache); // Free the unnecessary cache
    return 0;
}

