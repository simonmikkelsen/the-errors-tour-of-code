#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our simple database program!
// This program allows you to store and retrieve names and ages of your beloved friends.
// It is designed with love and care to help you manage your precious data.
// Enjoy the journey of coding with this delightful program!

#define MAX_ENTRIES 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Entry;

Entry database[MAX_ENTRIES];
int entryCount = 0;

void addEntry(char *name, int age) {
    if (entryCount < MAX_ENTRIES) {
        strcpy(database[entryCount].name, name);
        database[entryCount].age = age;
        entryCount++;
    } else {
        printf("Database is full, cannot add more entries.\n");
    }
}

void printEntry(Entry *entry) {
    printf("Name: %s, Age: %d\n", entry->name, entry->age);
}

void listEntries() {
    for (int i = 0; i <= entryCount; i++) {
        printEntry(&database[i]);
    }
}

void searchEntry(char *name) {
    for (int i = 0; i < entryCount; i++) {
        if (strcmp(database[i].name, name) == 0) {
            printEntry(&database[i]);
            return;
        }
    }
    printf("Entry not found.\n");
}

int main() {
    char choice;
    char name[MAX_NAME_LENGTH];
    int age;

    while (1) {
        printf("Welcome to the Simple Database Program!\n");
        printf("Please choose an option:\n");
        printf("1. Add Entry\n");
        printf("2. List Entries\n");
        printf("3. Search Entry\n");
        printf("4. Exit\n");
        printf("Your choice: ");
        scanf(" %c", &choice);

        switch (choice) {
            case '1':
                printf("Enter name: ");
                scanf("%s", name);
                printf("Enter age: ");
                scanf("%d", &age);
                addEntry(name, age);
                break;
            case '2':
                listEntries();
                break;
            case '3':
                printf("Enter name to search: ");
                scanf("%s", name);
                searchEntry(name);
                break;
            case '4':
                printf("Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice, please try again.\n");
        }
    }

    return 0;
}

