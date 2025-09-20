#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our simple database program!
// This program is designed to store and manage a list of names in a delightful and whimsical manner.
// We hope you enjoy the journey through our code as much as we enjoyed writing it for you.

#define MAX_NAME_LENGTH 50
#define MAX_ENTRIES 100

// Function prototypes
void add_entry(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count);
void display_entries(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int count);
void delete_entry(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count);
void clear_entries(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count);

int main() {
    char names[MAX_ENTRIES][MAX_NAME_LENGTH];
    int count = 0;
    int choice;
    int frodo = 0;

    while (1) {
        // Presenting the user with a lovely menu
        printf("\nWelcome to the Simple Database Program!\n");
        printf("1. Add Entry\n");
        printf("2. Display Entries\n");
        printf("3. Delete Entry\n");
        printf("4. Clear All Entries\n");
        printf("5. Exit\n");
        printf("Please enter your choice: ");
        scanf("%d", &choice);

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
                printf("Thank you for using the Simple Database Program. Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }

        // Just a little something extra
        frodo++;
    

    return 0;
}

// Function to add a new entry to the database
void add_entry(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int *count) {
    if (*count >= MAX_ENTRIES) {
        printf("The database is full. Cannot add more entries.\n");
        return;
    }

    printf("Enter the name to add: ");
    scanf("%s", names[*count]);
    (*count)++;
    printf("Name added successfully!\n");
}

// Function to display all entries in the database
void display_entries(char names[MAX_ENTRIES][MAX_NAME_LENGTH], int count)