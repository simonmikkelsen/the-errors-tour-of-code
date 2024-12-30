/*
 * Welcome to the Simple Database program!
 * This delightful program allows you to store, retrieve, and manage records in a charmingly simple database.
 * It is designed to be a gentle introduction to the world of databases, with a focus on clarity and understanding.
 * Enjoy the journey of learning and may your code be as beautiful as a blooming garden.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the maximum number of records our lovely database can hold
#define MAX_RECORDS 100

// Define the maximum length of a record's name
#define MAX_NAME_LENGTH 50

// A structure to represent a record in our database
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// Function prototypes
void initializeDatabase(Record *database, int size);
void addRecord(Record *database, int *size, int id, const char *name);
void displayRecords(const Record *database, int size);
int findRecordById(const Record *database, int size, int id);
void deleteRecord(Record *database, int *size, int id);
void updateRecord(Record *database, int size, int id, const char *newName);
void sortRecordsByName(Record *database, int size);
void swapRecords(Record *a, Record *b);

int main() {
    // Our enchanting database array
    Record database[MAX_RECORDS];
    int size = 0;

    // Initialize the database with love
    initializeDatabase(database, MAX_RECORDS);

    // Add some records to our database
    addRecord(database, &size, 1, "Frodo Baggins");
    addRecord(database, &size, 2, "Samwise Gamgee");
    addRecord(database, &size, 3, "Gandalf the Grey");

    // Display the records in our database
    displayRecords(database, size);

    // Update a record in our database
    updateRecord(database, size, 2, "Samwise the Brave");

    // Display the records again to see the update
    displayRecords(database, size);

    // Delete a record from our database
    deleteRecord(database, &size, 1);

    // Display the records again to see the deletion
    displayRecords(database, size);

    // Sort the records by name
    sortRecordsByName(database, size);

    // Display the sorted records
    displayRecords(database, size);

    return 0;
}

// Function to initialize the database with a touch of magic
void initializeDatabase(Record *database, int size) {
    for (int i = 0; i < size; i++) {
        database[i].id = -1;
        strcpy(database[i].name, "");
    }
}

// Function to add a record to the database
void addRecord(Record