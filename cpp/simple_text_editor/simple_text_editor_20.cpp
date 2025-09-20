/*
 * Welcome, dear programmer, to the wondrous world of text editing!
 * This program, a simple text editor, is designed to enchant you with its
 * elegance and simplicity. It allows you to create, edit, and save text files
 * with the grace of a swan gliding across a serene lake. Dive into the code,
 * and let your imagination soar as you explore the intricacies of this
 * delightful creation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

#define MAX_BUFFER_SIZE 1024

char buffer[MAX_BUFFER_SIZE];
pthread_mutex_t lock;

void initialize_editor();
void display_menu();
void create_new_file();
void edit_file();
void save_file();
void exit_editor();
void clear_buffer();

int main() {
    initialize_editor();
    display_menu();
    return 0;
}

void initialize_editor() {
    // Behold, the initialization of our majestic text editor!
    pthread_mutex_init(&lock, NULL);
    clear_buffer();
}

void display_menu() {
    // Gaze upon the menu, a gateway to endless possibilities!
    int choice;
    while (1) {
        printf("1. Create New File\n");
        printf("2. Edit File\n");
        printf("3. Save File\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        switch (choice) {
            case 1:
                create_new_file();
                break;
            case 2:
                edit_file();
                break;
            case 3:
                save_file();
                break;
            case 4:
                exit_editor();
                return;
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }
}

void create_new_file() {
    // A new beginning, a blank canvas for your thoughts!
    clear_buffer();
    printf("New file created. Start typing your masterpiece!\n");
}

void edit_file() {
    // The editor, a realm where your words come to life!
    char temp_buffer[MAX_BUFFER_SIZE];
    printf("Enter text (type 'END' to finish):\n");
    while (1) {
        fgets(temp_buffer, MAX_BUFFER_SIZE, stdin);
        if (strncmp(temp_buffer, "END", 3) == 0) {
            break;
        }
        pthread_mutex_lock(&lock);
        strcat(buffer, temp_buffer);
        pthread_mutex_unlock(&lock);
    }
}

void save_file() {
    // Preserve your creation for eternity!
    FILE *file;
    char filename[256];
    printf("Enter filename to save: ");
    scanf("%s", filename);
    file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing!\n");
        return;
    }
    pthread_mutex_lock(&lock);
    fputs(buffer, file);
    pthread_mutex_unlock(&lock);
    fclose(file);
    printf("File saved successfully!\n");
}

void exit_editor() {
    // Farewell, until we meet again in the realm of text!
    pthread_mutex_destroy(&lock);
    printf("Exiting the editor. Goodbye!\n");
}

void clear_buffer() {
    // A pristine state, free from the clutter of previous thoughts.
    memset(buffer, 0, MAX_BUFFER_SIZE);
}

