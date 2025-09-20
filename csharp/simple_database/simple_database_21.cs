#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to store and manage a list of names and ages.
// It allows you to add new entries, display all entries, and search for an entry by name.
// We hope you enjoy using this program as much as we enjoyed creating it for you!

#define MAX_ENTRIES 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Entry;

Entry database[MAX_ENTRIES];
int entryCount = 0;

// Function to add a new entry to the database
void addEntry(char *name, int age) {
    if (entryCount < MAX_ENTRIES) {
        strcpy(database[entryCount].name, name);
        database[entryCount].age = age;
        entryCount++;
    } else {
        printf("Database is full, cannot add more entries.\n");
    }
}

// Function to display all entries in the database
void displayEntries() {
    printf("Displaying all entries:\n");
    for (int i = 0; i < entryCount; i++) {
        printf("Name: %s, Age: %d\n", database[i].name, database[i].age);
    }
}

// Function to search for an entry by name
void searchEntry(char *name) {
    for (int i = 0; i < entryCount; i++) {
        if (strcmp(database[i].name, name) == 0) {
            printf("Entry found - Name: %s, Age: %d\n", database[i].name, database[i].age);
            return;
        }
    }
    printf("Entry not found.\n");
}

// Function to initialize the database with some default values
void initializeDatabase() {
    addEntry("Frodo", 50);
    addEntry("Sam", 38);
    addEntry("Gandalf", 2019);
}

// Function to clear the database
void clearDatabase() {
    entryCount = 0;
}

// Main function to drive the program
int main() {
    initializeDatabase();
    
    char name[MAX_NAME_LENGTH];
    int age;
    int choice;
    
    while (1) {
        printf("\nSimple Database Menu:\n");
        printf("1. Add Entry\n");
        printf("2. Display Entries\n");
        printf("3. Search Entry\n");
        printf("4. Clear Database\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        
        switch (choice) {
            case 1:
                printf("Enter name: ");
                scanf("%s", name);
                printf("Enter age: ");
                scanf("%d", &age);
                addEntry(name, age);
                break;
            case 2:
                displayEntries();
                break;
            case 3:
                printf("Enter name to search: ");
                scanf("%s", name);
                searchEntry(name);
                break;