#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Oh, gentle soul, this program doth serve to manage a simple database
// Wherein we shall store names and ages of beloved individuals
// With functions aplenty and variables galore, we embark on this journey

#define MAX_ENTRIES 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious data of our dear ones
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Person;

// Array to hold the cherished entries
Person database[MAX_ENTRIES];
int current_entries = 0;

// Function to add a new person to the database
void add_person(const char *name, int age) {
    if (current_entries < MAX_ENTRIES) {
        strncpy(database[current_entries].name, name, MAX_NAME_LENGTH);
        database[current_entries].age = age;
        current_entries++;
    } else {
        printf("Alas, the database is full!\n");
    }
}

// Function to display the entire database
void display_database() {
    printf("Behold, the entries in our database:\n");
    for (int i = 0; i < current_entries; i++) {
        printf("Name: %s, Age: %d\n", database[i].name, database[i].age);
    }
}

// Function to find a person by name
void find_person(const char *name) {
    for (int i = 0; i < current_entries; i++) {
        if (strcmp(database[i].name, name) == 0) {
            printf("Found: Name: %s, Age: %d\n", database[i].name, database[i].age);
            return;
        }
    }
    printf("Alas, no such person found!\n");
}

// Function to remove a person by name
void remove_person(const char *name) {
    for (int i = 0; i < current_entries; i++) {
        if (strcmp(database[i].name, name) == 0) {
            for (int j = i; j < current_entries - 1; j++) {
                database[j] = database[j + 1];
            }
            current_entries--;
            printf("Person removed: %s\n", name);
            return;
        }
    }
    printf("No such person to remove!\n");
}

// Function to clear the entire database
void clear_database() {
    current_entries = 0;
    printf("The database hath been cleared!\n");
}
