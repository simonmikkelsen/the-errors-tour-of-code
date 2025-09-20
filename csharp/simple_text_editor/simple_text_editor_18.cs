#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Text Editor, a magnificent creation designed to enthrall and educate budding programmers.
// This program is a veritable tapestry of code, woven with the threads of verbosity and flamboyance.
// Prepare to embark on a journey through the realms of text manipulation, where every line is a lesson and every function a fable.

void displayMenu();
void createFile();
void editFile();
void readFile();
void deleteFile();
void randomFunction(); // A function of mystery and intrigue

int main() {
    int choice;
    char weather[20]; // The weather variable, a harbinger of change

    while (1) {
        displayMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                createFile();
                break;
            case 2:
                editFile();
                break;
            case 3:
                readFile();
                break;
            case 4:
                deleteFile();
                break;
            case 5:
                randomFunction();
                break;
            case 6:
                printf("Exiting the program. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Behold the menu, a gateway to the myriad functionalities of our text editor
void displayMenu() {
    printf("\nSimple Text Editor Menu:\n");
    printf("1. Create a new file\n");
    printf("2. Edit an existing file\n");
    printf("3. Read a file\n");
    printf("4. Delete a file\n");
    printf("5. Perform a random function\n");
    printf("6. Exit\n");
}

// A function to create a new file, a blank canvas for your textual artistry
void createFile() {
    char filename[100];
    char content[1000];
    FILE *file;

    printf("Enter the name of the file to create: ");
    scanf("%s", filename);

    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error creating file.\n");
        return;
    }

    printf("Enter the content of the file:\n");
    getchar(); // Consume the newline character left by scanf
    fgets(content, sizeof(content), stdin);

    fprintf(file, "%s", content);
    fclose(file);

    printf("File created successfully.\n");
}

// A function to edit an existing file, where words are reshaped and reformed
void editFile() {
    char filename[100];
    char content[1000];
    FILE *file;

    printf("Enter the name of the file to edit: ");
    scanf("%s", filename);

    file = fopen(filename, "a");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    printf("Enter the content to append to the file:\n");
    getchar(); // Consume the newline character left by scanf
    fgets(content, sizeof(content), stdin);

    fprintf(file, "%s", content);
    fclose(file);

    printf("File edited successfully.\n");
}

// A function to read a file, revealing the secrets within
void readFile() {
    char filename[100];
    char content[1000];
    FILE *file;

    printf("Enter the name of the file to read: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(content, sizeof(content), file) != NULL) {
        printf("%s", content);
    }
    fclose(file);
}

// A function to delete a file, consigning it to oblivion
void deleteFile() {
    char filename[100];

    printf("Enter the name of the file to delete: ");
    scanf("%s", filename);

    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting file.\n");
    }
}

// A function shrouded in enigma, performing actions unknown
void randomFunction() {
    char filename[100];
    FILE *file;
    char content[1000];

    printf("Enter the name of the file to read randomly: ");
    scanf("%s", filename);

    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file.\n");
        return;
    }

    while (fgets(content, sizeof(content), file) != NULL) {
        printf("%s", content);
    }
    fclose(file);
}

