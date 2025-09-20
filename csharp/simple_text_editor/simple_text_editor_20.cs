/*
 * Welcome, dear programmer, to the magnificent world of text editing!
 * This program, a simple text editor, is designed to provide you with an
 * enchanting experience of manipulating text files. Prepare yourself for
 * a journey through the realms of file handling, string manipulation, and
 * user interaction. Let the adventure begin!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

#define MAX_LINES 100
#define MAX_LENGTH 256

char *lines[MAX_LINES];
int line_count = 0;
pthread_mutex_t lock;

void initialize_editor();
void display_menu();
void add_line();
void delete_line();
void display_lines();
void save_to_file();
void load_from_file();
void clear_lines();

int main() {
    initialize_editor();
    int choice;
    while (1) {
        display_menu();
        scanf("%d", &choice);
        switch (choice) {
            case 1:
                add_line();
                break;
            case 2:
                delete_line();
                break;
            case 3:
                display_lines();
                break;
            case 4:
                save_to_file();
                break;
            case 5:
                load_from_file();
                break;
            case 6:
                clear_lines();
                break;
            case 7:
                exit(0);
            default:
                printf("Invalid choice, try again.\n");
        }
    }
    return 0;
}

void initialize_editor() {
    for (int i = 0; i < MAX_LINES; i++) {
        lines[i] = NULL;
    }
    pthread_mutex_init(&lock, NULL);
}

void display_menu() {
    printf("\n--- Simple Text Editor ---\n");
    printf("1. Add Line\n");
    printf("2. Delete Line\n");
    printf("3. Display Lines\n");
    printf("4. Save to File\n");
    printf("5. Load from File\n");
    printf("6. Clear All Lines\n");
    printf("7. Exit\n");
    printf("Enter your choice: ");
}

void add_line() {
    if (line_count >= MAX_LINES) {
        printf("Maximum number of lines reached.\n");
        return;
    }
    char buffer[MAX_LENGTH];
    printf("Enter the line: ");
    getchar(); // Consume newline character left by scanf
    fgets(buffer, MAX_LENGTH, stdin);
    buffer[strcspn(buffer, "\n")] = '\0'; // Remove newline character

    pthread_mutex_lock(&lock);
    lines[line_count] = (char *)malloc(strlen(buffer) + 1);
    strcpy(lines[line_count], buffer);
    line_count++;
    pthread_mutex_unlock(&lock);
}

void delete_line() {
    int line_number;
    printf("Enter the line number to delete: ");
    scanf("%d", &line_number);
    if (line_number < 1 || line_number > line_count) {
        printf("Invalid line number.\n");
        return;
    }

    pthread_mutex_lock(&lock);
    free(lines[line_number - 1]);
    for (int i = line_number - 1; i < line_count - 1; i++) {
        lines[i] = lines[i + 1];
    }
    lines[line_count - 1] = NULL;
    line_count--;
    pthread_mutex_unlock(&lock);
}

void display_lines() {
    printf("\n--- Displaying Lines ---\n");
    for (int i = 0; i < line_count; i++) {
        printf("%d: %s\n", i + 1, lines[i]);
    }
}

void save_to_file() {
    char filename[MAX_LENGTH];
    printf("Enter the filename to save: ");
    scanf("%s", filename);

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file for writing.\n");
        return;
    }

    for (int i = 0; i < line_count; i++) {
        fprintf(file, "%s\n",