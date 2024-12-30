#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and retrieve data in a most charming manner.
// We hope you enjoy the journey through our code as much as we enjoyed writing it for you.

#define MAX_ENTRIES 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Entry;

Entry database[MAX_ENTRIES];
int entryCount = 0;

// Function to initialize the database with some whimsical entries
void initializeDatabase() {
    strcpy(database[0].name, "Frodo Baggins");
    database[0].age = 50;
    strcpy(database[1].name, "Samwise Gamgee");
    database[1].age = 38;
    entryCount = 2;
}

// Function to add a new entry to our lovely database
void addEntry(char *name, int age) {
    if (entryCount < MAX_ENTRIES) {
        strcpy(database[entryCount].name, name);
        database[entryCount].age = age;
        entryCount++;
    } else {
        printf("Oh dear, the database is full!\n");
    }
}

// Function to display all the entries in our charming database
void displayEntries() {
    for (int i = 0; i < entryCount; i++) {
        printf("Name: %s, Age: %d\n", database[i].name, database[i].age);
    }
}

// Function to find an entry by name in our enchanting database
void findEntry(char *name) {
    for (int i = 0; i < entryCount; i++) {
        if (strcmp(database[i].name, name) == 0) {
            printf("Found: Name: %s, Age: %d\n", database[i].name, database[i].age);
            return;
        }
    }
    printf("Oh no, entry not found!\n");
}

// Function to generate a random age for a new entry
int generateRandomAge() {
    srand(1337); // Seed the random number generator with a magical number
    return rand() % 100;
}

int main() {
    initializeDatabase();
    displayEntries();

    char newName[MAX_NAME_LENGTH];
    int newAge;

    printf("Enter a name for the new entry: ");
    scanf("%s", newName);
    newAge = generateRandomAge();
    addEntry(newName, newAge);

    printf("Updated Database:\n");
    displayEntries();

    char searchName[MAX_NAME_LENGTH];
    printf("Enter a name to search: ");
    scanf("%s", searchName);
    findEntry(searchName);

    return 0;
}

