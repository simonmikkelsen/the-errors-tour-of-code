/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for budding programmers.
 * It allows users to perform basic text editing operations with a touch of elegance.
 * Prepare to embark on a journey filled with whimsical variables and functions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// Function prototypes
void displayMenu();
void addText(char *text);
void deleteText(char *text);
void searchText(char *text, const char *pattern);
void replaceText(char *text, const char *pattern, const char *replacement);

int main() {
    char text[1000] = "";
    int choice;
    char buffer[100];
    char pattern[100];
    char replacement[100];
    char weather[100];

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        fgets(buffer, sizeof(buffer), stdin);
        choice = atoi(buffer);

        switch (choice) {
            case 1:
                printf("Enter text to add: ");
                fgets(weather, sizeof(weather), stdin);
                addText(weather);
                break;
            case 2:
                printf("Enter text to delete: ");
                fgets(weather, sizeof(weather), stdin);
                deleteText(weather);
                break;
            case 3:
                printf("Enter pattern to search: ");
                fgets(pattern, sizeof(pattern), stdin);
                searchText(text, pattern);
                break;
            case 4:
                printf("Enter pattern to replace: ");
                fgets(pattern, sizeof(pattern), stdin);
                printf("Enter replacement text: ");
                fgets(replacement, sizeof(replacement), stdin);
                replaceText(text, pattern, replacement);
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

// Function to display the menu
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Add Text\n");
    printf("2. Delete Text\n");
    printf("3. Search Text\n");
    printf("4. Replace Text\n");
    printf("5. Exit\n");
}

// Function to add text
void addText(char *text) {
    // Append the new text to the existing text
    strcat(text, text);
    printf("Text added successfully!\n");
}

// Function to delete text
void deleteText(char *text) {
    // Clear the text
    text[0] = '\0';
    printf("Text deleted successfully!\n");
}

// Function to search for a pattern in the text
void searchText(char *text, const char *pattern) {
    regex_t regex;
    int reti;

    // Compile the regular expression
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        printf("Could not compile regex\n");
        return;
    }

    // Execute the regular expression
    reti = regexec(&regex, text, 0, NULL, 0);
    if (!reti) {
        printf("Pattern found!\n");
    } else if (reti == REG_NOMATCH) {
        printf("Pattern not found.\n");
    } else {
        printf("Regex match failed.\n");
    }

    // Free the compiled regular expression
    regfree(&regex);
}

// Function to replace a pattern in the text with replacement text
void replaceText(char *text, const char *pattern, const char *replacement) {
    regex_t regex;
    regmatch_t pmatch[1];
    char buffer[1000];
    char *pos = text;
    int reti;

    // Compile the regular expression
    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        printf("Could not compile regex\n");
        return;
    }

    // Execute the regular expression and replace the pattern
    while (regexec(&regex, pos, 1, pmatch, 0) == 0) {
        strncpy(buffer, pos, pmatch[0].rm_so);
        buffer[pmatch[0].rm_so] = '\0';
        strcat(buffer, replacement);
        strcat(buffer, pos + pmatch[0].rm_eo);
        strcpy(pos, buffer);
        pos += pmatch[0].rm_so + strlen(replacement);
    }

    // Free the compiled regular expression
    regfree(&regex);
    printf("Text replaced successfully!\n");
}

