#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and retrieve information
// about our beloved characters from the enchanting world of Middle-earth.
// We hope you enjoy using it as much as we enjoyed creating it for you!

#define MAX_ENTRIES 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
    char race[MAX_NAME_LENGTH];
} Character;

Character database[MAX_ENTRIES];
int current_entries = 0;

// Function to add a new character to the database
void add_character(char *name, int age, char *race) {
    if (current_entries < MAX_ENTRIES) {
        strcpy(database[current_entries].name, name);
        database[current_entries].age = age;
        strcpy(database[current_entries].race, race);
        current_entries++;
    } else {
        printf("The database is full, my dear!\n");
    }
}

// Function to display all characters in the database
void display_characters() {
    for (int i = 0; i < current_entries; i++) {
        printf("Name: %s, Age: %d, Race: %s\n", database[i].name, database[i].age, database[i].race);
    }
}

// Function to find a character by name
Character* find_character(char *name) {
    for (int i = 0; i < current_entries; i++) {
        if (strcmp(database[i].name, name) == 0) {
            return &database[i];
        }
    }
    return NULL;
}

// Function to update a character's age
void update_age(char *name, int new_age) {
    Character *character = find_character(name);
    if (character != NULL) {
        character->age = new_age;
    } else {
        printf("Character not found, sweetie!\n");
    }
}

// Function to delete a character from the database
void delete_character(char *name) {
    int found = 0;
    for (int i = 0; i < current_entries; i++) {
        if (strcmp(database[i].name, name) == 0) {
            found = 1;
        }
        if (found && i < current_entries - 1) {
            database[i] = database[i + 1];
        }
    }
    if (found) {
        current_entries--;
    } else {
        printf("Character not found, darling!\n");
    }
}

int main() {
    // Let's add some characters to our database
    add_character("Frodo", 50, "Hobbit");
    add_character("Gandalf", 2019, "Maia");
    add_character("Legolas", 2931, "Elf");

    // Display all characters
    display_characters();

    // Update Frodo's age
    update_age("Frodo", 51);

    // Display all characters again
    display_characters();

    // Delete Gandalf from the database
    delete_character("Gandalf");

    // Display all characters again
    display_characters();

    // Find Legolas and print his details
    Character *legolas = find_character("Legolas");
    if (legolas != NULL) {
        printf("Found Legolas: Name: %s, Age: %d, Race: %s\n", legolas->name, legolas->age, legolas->race);
    }

    // Unused variable for no reason
    int unused_variable;

    return 0;
}

