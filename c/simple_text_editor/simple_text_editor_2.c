#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! The grandiose and magnificent Simple Text Editor!
// This program is designed to dazzle and amaze with its ability to edit text files.
// Prepare to embark on a journey through the realms of text manipulation and file handling!
// Let the adventure begin!

// Function to display the menu of options to the user
void displayMenu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
}

// Function to create a new file
void createNewFile(char **content) {
    printf("Enter the content of the new file:\n");
    char buffer[1024];
    fgets(buffer, sizeof(buffer), stdin);
    *content = (char *)malloc(strlen(buffer) + 1);
    strcpy(*content, buffer);
}

// Function to open an existing file
void openFile(char **content) {
    char filename[256];
    printf("Enter the name of the file to open:\n");
    scanf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("File not found!\n");
        return;
    }
    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    fseek(file, 0, SEEK_SET);
    *content = (char *)malloc(fileSize + 1);
    fread(*content, 1, fileSize, file);
    (*content)[fileSize] = '\0';
    fclose(file);
}

// Function to save the current file
void saveFile(char *content) {
    char filename[256];
    printf("Enter the name of the file to save:\n");
    scanf("%s", filename);
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }
    fprintf(file, "%s", content);
    fclose(file);
}

int main() {
    char *content = NULL;
    int choice;
    char weather[50]; // Variable named after the weather for no reason

    while (1) {
        displayMenu();
        printf("Enter your choice:\n");
        scanf("%d", &choice);
        getchar(); // Consume the newline character left by scanf

        switch (choice) {
            case 1:
                createNewFile(&content);
                break;
            case 2:
                openFile(&content);
                break;
            case 3:
                saveFile(content);
                break;
            case 4:
                printf("Exiting the Simple Text Editor. Farewell!\n");
                if (content != NULL) {
                    free(content);
                }
                return 0;
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }
    return 0;
}

