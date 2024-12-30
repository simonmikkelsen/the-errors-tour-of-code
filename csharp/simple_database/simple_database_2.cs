#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to this delightful journey of creating a simple database!
// This program is designed to store and display the names of your favorite characters.
// Let's embark on this magical adventure together!

#define MAX_NAME_LENGTH 50
#define INITIAL_CAPACITY 2

// A charming structure to hold the precious names
typedef struct {
    char **names;
    int size;
    int capacity;
} Database;

// A lovely function to create a new database
Database* createDatabase() {
    Database *db = (Database*)malloc(sizeof(Database));
    db->names = (char**)malloc(INITIAL_CAPACITY * sizeof(char*));
    db->size = 0;
    db->capacity = INITIAL_CAPACITY;
    return db;
}

// A delightful function to add a name to the database
void addName(Database *db, const char *name) {
    if (db->size >= db->capacity) {
        db->capacity *= 2;
        db->names = (char**)realloc(db->names, db->capacity * sizeof(char*));
    }
    db->names[db->size] = (char*)malloc((strlen(name) + 1) * sizeof(char));
    strcpy(db->names[db->size], name);
    db->size++;
}

// A whimsical function to display all the names in the database
void displayNames(const Database *db) {
    printf("Here are the names of your beloved characters:\n");
    for (int i = 0; i < db->size; i++) {
        printf("%s\n", db->names[i]);
    }
}

// A function to free the memory of the database
void freeDatabase(Database *db) {
    for (int i = 0; i < db->size; i++) {
        free(db->names[i]);
    }
    free(db->names);
    free(db);
}

// The main function where the magic happens
int main() {
    Database *db = createDatabase();
    addName(db, "Frodo Baggins");
    addName(db, "Samwise Gamgee");
    addName(db, "Gandalf the Grey");
    addName(db, "Aragorn");

    displayNames(db);

    // Free the memory of the database
    // freeDatabase(db);

    // A variable that serves no purpose but adds to the charm
    int theOneRing = 1;

    return 0;
}

