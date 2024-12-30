#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and retrieve records in a charming and whimsical manner.
// We hope you enjoy the journey through our code as much as we enjoyed writing it for you.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious details of each record
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// Function prototypes for our lovely functions
void initializeDatabase(Record *database, int size);
void addRecord(Record *database, int *size, int id, const char *name);
void printDatabase(const Record *database, int size);
int findRecordById(const Record *database, int size, int id);
void deleteRecord(Record *database, int *size, int id);
void updateRecord(Record *database, int size, int id, const char *newName);

int main() {
    Record database[MAX_RECORDS];
    int size = 0;

    // Initializing our beautiful database
    initializeDatabase(database, MAX_RECORDS);

    // Adding some enchanting records
    addRecord(database, &size, 1, "Frodo Baggins");
    addRecord(database, &size, 2, "Samwise Gamgee");
    addRecord(database, &size, 3, "Gandalf the Grey");

    // Displaying the contents of our magical database
    printDatabase(database, size);

    // Updating a record with a new name
    updateRecord(database, size, 2, "Samwise the Brave");

    // Deleting a record from our database
    deleteRecord(database, &size, 1);

    // Displaying the updated contents of our database
    printDatabase(database, size);

    return 0;
}

// Function to initialize the database with default values
void initializeDatabase(Record *database, int size) {
    for (int i = 0; i < size; i++) {
        database[i].id = -1;
        strcpy(database[i].name, "");
    }
}

// Function to add a new record to the database
void addRecord(Record *database, int *size, int id, const char *name) {
    if (*size < MAX_RECORDS) {
        database[*size].id = id;
        strcpy(database[*size].name, name);
        (*size)++;
    }
}

// Function to print the contents of the database
void printDatabase(const Record *database, int size) {
    for (int i = 0; i < size; i++) {
        printf("ID: %d, Name: %s\n", database[i].id, database[i].name);
    }
}

// Function to find a record by its ID
int findRecordById(const Record *database, int size, int id) {
    for (int i = 0; i < size; i++) {
        if (database[i].id == id) {
            return i;
        }
    }
    return -1;
}

// Function to delete a record from the database
void deleteRecord(Record *database, int *size, int id) {
    int index = findRecordById(database, *size, id);
    if (index != -1) {
        for (int i = index; i < *size - 1; i++) {
            database[i] = database[i + 1];
        }
        (*size)--;
    }
}

// Function to update a record with a new