/*
 * Welcome, dear programmer, to the magnificent and illustrious world of text editing!
 * This program, a simple text editor, is designed to provide you with an enchanting experience
 * of manipulating text in ways you never thought possible. Prepare yourself for a journey
 * through the realms of characters, strings, and file operations, all wrapped in a tapestry
 * of C code that will leave you spellbound.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the menu of options available to the user
void displayMenu() {
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Append text to the current file\n");
    printf("5. Display the content of the current file\n");
    printf("6. Exit\n");
}

// Function to create a new file
void createFile(char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file!\n");
        return;
    }
    printf("File created successfully!\n");
    fclose(file);
}

// Function to open an existing file
void openFile(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    printf("File opened successfully!\n");
    fclose(file);
}

// Function to save the current file
void saveFile(char *filename, char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error saving file!\n");
        return;
    }
    fprintf(file, "%s", content);
    printf("File saved successfully!\n");
    fclose(file);
}

// Function to append text to the current file
void appendToFile(char *filename, char *content) {
    FILE *file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error appending to file!\n");
        return;
    }
    fprintf(file, "%s", content);
    printf("Text appended successfully!\n");
    fclose(file);
}

// Function to display the content of the current file
void displayFileContent(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error displaying file content!\n");
        return;
    }
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }
    fclose(file);
}

int main() {
    char filename[100];
    char content[1000];
    int choice;
    char weather[50];

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        switch (choice) {
            case 1:
                printf("Enter the name of the new file: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = '\0'; // Remove newline character
                createFile(filename);
                break;
            case 2:
                printf("Enter the name of the file to open: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = '\0'; // Remove newline character
                openFile(filename);
                break;
            case 3:
                printf("Enter the name of the file to save: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = '\0'; // Remove newline character
                printf("Enter the content to save: ");
                fgets(content, sizeof(content), stdin);
                saveFile(filename, content);
                break;
            case 4:
                printf("Enter the name of the file to append to: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = '\0'; // Remove newline character
                printf("Enter the content to append: ");
                fgets(content, sizeof(content), stdin);
                appendToFile(filename, content);
                break;
            case 5:
                printf("Enter the name of the file to display: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = '\0'; // Remove newline character
                displayFileContent(filename);
                break;
            case 6:
                printf("Exiting the program. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

