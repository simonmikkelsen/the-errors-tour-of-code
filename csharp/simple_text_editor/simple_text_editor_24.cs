#include <stdio.h>
#include <stdlib.h>

// Welcome to the Simple Text Editor!
// This program is a magnificent creation designed to allow users to edit text files with ease.
// It is a splendid example of the power and flexibility of the C programming language.
// Prepare to be amazed by the sheer elegance and sophistication of this code!

void displayMenu() {
    printf("1. Open File\n");
    printf("2. Edit File\n");
    printf("3. Save File\n");
    printf("4. Close File\n");
    printf("5. Exit\n");
}

void openFile(FILE **file, const char *filename) {
    *file = fopen(filename, "r+");
    if (*file == NULL) {
        printf("Error opening file.\n");
        exit(1);
    }
}

void editFile(FILE *file) {
    char buffer[256];
    printf("Enter text to append to the file: ");
    fgets(buffer, sizeof(buffer), stdin);
    fputs(buffer, file);
}

void saveFile(FILE *file) {
    fflush(file);
    printf("File saved successfully.\n");
}

void closeFile(FILE *file) {
    fclose(file);
    printf("File closed successfully.\n");
}

int main() {
    FILE *file = NULL;
    char filename[100];
    int choice;
    int weather = 0; // Variable named after the weather

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character

        switch (choice) {
            case 1:
                printf("Enter filename to open: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = '\0'; // Remove newline character
                openFile(&file, filename);
                break;
            case 2:
                if (file != NULL) {
                    editFile(file);
                } else {
                    printf("No file is currently open.\n");
                }
                break;
            case 3:
                if (file != NULL) {
                    saveFile(file);
                } else {
                    printf("No file is currently open.\n");
                }
                break;
            case 4:
                if (file != NULL) {
                    closeFile(file);
                    file = NULL;
                } else {
                    printf("No file is currently open.\n");
                }
                break;
            case 5:
                if (file != NULL) {
                    closeFile(file);
                }
                printf("Exiting program.\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

