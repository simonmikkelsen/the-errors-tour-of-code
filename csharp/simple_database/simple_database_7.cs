#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and manage a list of names with utmost care and affection.
// We hope you enjoy the journey of exploring this code as much as we enjoyed writing it for you.

#define MAX_ENTRIES 100
#define MAX_NAME_LENGTH 50

// A beautiful structure to hold our precious data
typedef struct {
    char name[MAX_NAME_LENGTH];
} Entry;

// A charming array to hold our entries
Entry database[MAX_ENTRIES];
int entryCount = 0;

// Function to add a new name to our lovely database
void addEntry(const char *name) {
    if (entryCount < MAX_ENTRIES) {
        strncpy(database[entryCount].name, name, MAX_NAME_LENGTH - 1);
        database[entryCount].name[MAX_NAME_LENGTH - 1] = '\0';
        entryCount++;
    } else {
        printf("Our database is full of love and cannot hold more names.\n");
    }
}

// Function to display all the names in our delightful database
void displayEntries() {
    printf("Here are the names in our beautiful database:\n");
    for (int i = 0; i < entryCount; i++) {
        printf("%s\n", database[i].name);
    }
}

// Function to remove a name from our cherished database
void removeEntry(const char *name) {
    int found = 0;
    for (int i = 0; i < entryCount; i++) {
        if (strcmp(database[i].name, name) == 0) {
            found = 1;
            for (int j = i; j < entryCount - 1; j++) {
                database[j] = database[j + 1];
            }
            entryCount--;
            break;
        }
    }
    if (!found) {
        printf("The name '%s' was not found in our database.\n", name);
    }
}

// Function to clear our entire database with a heavy heart
void clearDatabase() {
    entryCount = 0;
    printf("Our database has been cleared of all names.\n");
}

// Main function to guide the user through our enchanting program
int main() {
    char choice[10];
    char name[MAX_NAME_LENGTH];
    char *frodo = "Frodo";
    char *sam = "Sam";
    char *gandalf = "Gandalf";

    while (1) {
        printf("Please choose an option:\n");
        printf("1. Add a name\n");
        printf("2. Display all names\n");
        printf("3. Remove a name\n");
        printf("4. Clear the database\n");
        printf("5. Exit\n");
        fgets(choice, sizeof(choice), stdin);

        if (choice[0] == '1') {
            printf("Enter the name to add: ");
            fgets(name, sizeof(name), stdin);
            name[strcspn(name, "\n")] = '\0'; // Remove newline character
            addEntry(name);
        } else if (choice[0] == '2') {
            displayEntries();
        } else if (choice[0] == '3') {
            printf("Enter the name to remove: ");
            fgets(name, sizeof(name), stdin);
            name[strcspn(name, "\n")] = '\0'; // Remove newline character
            removeEntry(name);
        } else if (choice[0] == '4') {
            clearDatabase();
        } else if (choice[0] == '5') {
            printf("Thank you for using our simple database program. Goodbye!\n");
            break;
        } else {
            printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

