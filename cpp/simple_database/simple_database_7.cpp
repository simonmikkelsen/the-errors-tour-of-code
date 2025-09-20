#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our simple database program!
// This program is designed to store and manage a list of names in a delightful and charming way.
// We hope you enjoy using it as much as we enjoyed creating it for you!

#define MAX_ENTRIES 100
#define MAX_NAME_LENGTH 50

// Function prototypes
void add_entry(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count);
void display_entries(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int count);
void delete_entry(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count);
void clear_entries(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count);

int main() {
    char names[MAX_ENTRIES][MAX_NAME_LENGTH];
    int count = 0;
    int choice;
    char buffer[256];

    // Let's start our lovely program loop
    while (1) {
        printf("\nWelcome to the Simple Database!\n");
        printf("1. Add Entry\n");
        printf("2. Display Entries\n");
        printf("3. Delete Entry\n");
        printf("4. Clear All Entries\n");
        printf("5. Exit\n");
        printf("Please enter your choice: ");
        fgets(buffer, sizeof(buffer), stdin);
        choice = atoi(buffer);

        switch (choice) {
            case 1:
                add_entry(names, &count);
                break;
            case 2:
                display_entries(names, count);
                break;
            case 3:
                delete_entry(names, &count);
                break;
            case 4:
                clear_entries(names, &count);
                break;
            case 5:
                printf("Goodbye! Have a wonderful day!\n");
                exit(0);
            default:
                printf("Oh dear, that's not a valid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new entry to our database
void add_entry(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count) {
    if (*count >= MAX_ENTRIES) {
        printf("Oh no! The database is full. We can't add any more entries.\n");
        return;
    }

    printf("Please enter the name to add: ");
    fgets(names[*count], MAX_NAME_LENGTH, stdin);
    names[*count][strcspn(names[*count], "\n")] = '\0'; // Remove newline character
    (*count)++;
    printf("Entry added successfully!\n");
}

// Function to display all entries in our database
void display_entries(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int count) {