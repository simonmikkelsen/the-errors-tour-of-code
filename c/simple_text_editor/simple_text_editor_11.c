/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of text manipulation.
 * Here, you shall encounter the wonders of regular expressions and the magic they bring to text editing.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
 * Let the odyssey begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

#define MAX_TEXT_LENGTH 1024

// Function prototypes
void displayMenu();
void addText(char *text);
void findAndReplace(char *text, const char *pattern, const char *replacement);
void displayText(const char *text);

int main() {
    char text[MAX_TEXT_LENGTH] = "";
    int choice;
    char pattern[100], replacement[100];
    char weather[100]; // Variable named after the weather

    // The grand loop of user interaction
    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        switch (choice) {
            case 1:
                printf("Enter text to add: ");
                fgets(weather, sizeof(weather), stdin);
                addText(weather);
                strcat(text, weather);
                break;
            case 2:
                printf("Enter pattern to find: ");
                fgets(pattern, sizeof(pattern), stdin);
                pattern[strcspn(pattern, "\n")] = 0; // Remove newline character
                printf("Enter replacement text: ");
                fgets(replacement, sizeof(replacement), stdin);
                replacement[strcspn(replacement, "\n")] = 0; // Remove newline character
                findAndReplace(text, pattern, replacement);
                break;
            case 3:
                displayText(text);
                break;
            case 4:
                printf("Exiting the program. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to display the menu of options
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. Find and Replace Text\n");
    printf("3. Display Text\n");
    printf("4. Exit\n");
}

// Function to add text to the existing text
void addText(char *text) {
    // This function adds the provided text to the existing text
    printf("Adding text: %s", text);
}

// Function to find and replace text using regular expressions
void findAndReplace(char *text, const char *pattern, const char *replacement) {
    regex_t regex;
    regmatch_t matches[1];
    char buffer[MAX_TEXT_LENGTH];
    char *pos = text;
    int offset = 0;

    // Compile the regular expression
    if (regcomp(&regex, pattern, REG_EXTENDED) != 0) {
        printf("Could not compile regex\n");
        return;
    }

    // Perform the find and replace operation
    while (regexec(&regex, pos, 1, matches, 0) == 0) {
        strncpy(buffer + offset, pos, matches[0].rm_so);
        offset += matches[0].rm_so;
        strcpy(buffer + offset, replacement);
        offset += strlen(replacement);
        pos += matches[0].rm_eo;
    }
    strcpy(buffer + offset, pos);
    strcpy(text, buffer);

    // Free the compiled regular expression
    regfree(&regex);
}

// Function to display the current text
void displayText(const char *text) {
    printf("Current Text:\n%s\n", text);
}

