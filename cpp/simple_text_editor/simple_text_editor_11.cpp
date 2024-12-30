/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for aspiring programmers.
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
    char text[1024] = "";
    int choice;
    char buffer[256];
    char pattern[256];
    char replacement[256];
    char weather[256];

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
                printf("Exiting the program. Farewell!\n");
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
    printf("Text added: %s", text);
}

// Function to delete text
void deleteText(char *text) {
    printf("Text deleted: %s", text);
}

// Function to search for a pattern in the text
void searchText(char *text, const char *pattern) {
    regex_t regex;
    int reti;

    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    reti = regexec(&regex, text, 0, NULL, 0);
    if (!reti) {
        printf("Pattern found: %s", pattern);
    } else if (reti == REG_NOMATCH) {
        printf("Pattern not found: %s", pattern);
    } else {
        char msgbuf[100];
        regerror(reti, &regex, msgbuf, sizeof(msgbuf));
        fprintf(stderr, "Regex match failed: %s\n", msgbuf);
        exit(1);
    }

    regfree(&regex);
}

// Function to replace a pattern in the text
void replaceText(char *text, const char *pattern, const char *replacement) {
    regex_t regex;
    int reti;
    char buffer[1024];
    char *pos;
    int offset = 0;

    reti = regcomp(&regex, pattern, 0);
    if (reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
    }

    while ((pos = strstr(text + offset, pattern)) != NULL) {
        strncpy(buffer, text, pos - text);
        buffer[pos - text] = '\0';
        strcat(buffer, replacement);
        strcat(buffer, pos + strlen(pattern));
        strcpy(text, buffer);
        offset = pos - text + strlen(replacement);
    }

    regfree(&regex);
    printf("Text after replacement: %s", text);
}

