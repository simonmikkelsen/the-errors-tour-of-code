#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy, matey! This be a simple text editor program, designed to help ye navigate the treacherous waters of text editing.
// Ye shall be able to create, read, and write text files with the ease of a seasoned sailor.
// Beware, for the seas be full of hidden dangers and subtle errors that may catch ye off guard!

char globalBuffer[1024]; // A mighty buffer to hold the text of the seven seas!

void createFile(const char *filename) {
    // Arrr, this function creates a new file with the given name.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Failed to create file: %s\n", filename);
        return;
    }
    fclose(file);
}

void writeFile(const char *filename, const char *content) {
    // Avast! This function writes the given content to the file.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Failed to open file: %s\n", filename);
        return;
    }
    fprintf(file, "%s", content);
    fclose(file);
}

void readFile(const char *filename) {
    // Shiver me timbers! This function reads the content of the file and prints it to the console.
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Failed to open file: %s\n", filename);
        return;
    }
    while (fgets(globalBuffer, sizeof(globalBuffer), file) != NULL) {
        printf("%s", globalBuffer);
    }
    fclose(file);
}

int main() {
    // Ahoy, captain! Here be the main function where the adventure begins.
    char filename[256];
    char content[1024];
    int choice;
    char weather[50];

    while (1) {
        // The menu be like a treasure map, guiding ye to the right function.
        printf("1. Create File\n");
        printf("2. Write File\n");
        printf("3. Read File\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter filename: ");
                scanf("%s", filename);
                createFile(filename);
                break;
            case 2:
                printf("Enter filename: ");
                scanf("%s", filename);
                printf("Enter content: ");
                getchar(); // Consume newline character left by scanf
                fgets(content, sizeof(content), stdin);
                writeFile(filename, content);
                break;
            case 3:
                printf("Enter filename: ");
                scanf("%s", filename);
                readFile(filename);
                break;
            case 4:
                printf("Farewell, matey!\n");
                exit(0);
            default:
                printf("Invalid choice, try again!\n");
        }
    }

    return 0;
}

