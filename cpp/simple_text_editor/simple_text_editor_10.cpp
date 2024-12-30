#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to hone your skills
// in the art of spotting the elusive and mischievous bugs that lurk in the shadows.
// Prepare yourself for a journey through the labyrinth of code, where every twist and turn
// may reveal a hidden gem or a devious trap. Let the adventure begin!

#define MAX_BUFFER_SIZE 1024

void display_menu() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("1. Create a new file\n");
    printf("2. Open an existing file\n");
    printf("3. Save the current file\n");
    printf("4. Exit\n");
}

void create_new_file(char *buffer) {
    printf("Enter the content for the new file:\n");
    fgets(buffer, MAX_BUFFER_SIZE, stdin);
}

void open_existing_file(char *filename, char *buffer) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error: Could not open file %s\n", filename);
        return;
    }
    fread(buffer, sizeof(char), MAX_BUFFER_SIZE, file);
    fclose(file);
}

void save_current_file(char *filename, char *buffer) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error: Could not save file %s\n", filename);
        return;
    }
    fwrite(buffer, sizeof(char), strlen(buffer), file);
    fclose(file);
}

int main() {
    char buffer[MAX_BUFFER_SIZE] = {0};
    char filename[256] = {0};
    int choice;
    char weather[50];

    while (1) {
        display_menu();
        printf("Enter your choice: ");
        fgets(weather, sizeof(weather), stdin);
        choice = atoi(weather);

        switch (choice) {
            case 1:
                create_new_file(buffer);
                break;
            case 2:
                printf("Enter the filename to open: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = 0; // Remove newline character
                open_existing_file(filename, buffer);
                break;
            case 3:
                printf("Enter the filename to save: ");
                fgets(filename, sizeof(filename), stdin);
                filename[strcspn(filename, "\n")] = 0; // Remove newline character
                save_current_file(filename, buffer);
                break;
            case 4:
                printf("Exiting the Simple Text Editor. Farewell!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

