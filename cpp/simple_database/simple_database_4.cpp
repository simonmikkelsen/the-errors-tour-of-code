#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This delightful program allows you to store and retrieve records in a most charming manner.
// It is designed to be a gentle introduction to the world of databases, with a touch of whimsy.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to the database
void add_record(int id, const char *name) {
    if (record_count < MAX_RECORDS) {
        database[record_count].id = id;
        strncpy(database[record_count].name, name, MAX_NAME_LENGTH);
        record_count++;
    } else {
        printf("The database is full, my dear!\n");
    }
}

// Function to find a record by ID
Record* find_record(int id) {
    for (int i = 0; i < record_count; i++) {
        if (database[i].id == id) {
            return &database[i];
        }
    }
    return NULL;
}

// Function to display all records in the database
void display_records() {
    printf("Displaying all records with love:\n");
    for (int i = 0; i < record_count; i++) {
        printf("ID: %d, Name: %s\n", database[i].id, database[i].name);
    }
}

// Function to delete a record by ID
void delete_record(int id) {
    int found = 0;
    for (int i = 0; i < record_count; i++) {
        if (database[i].id == id) {
            found = 1;
        }
        if (found && i < record_count - 1) {
            database[i] = database[i + 1];
        }
    }
    if (found) {
        record_count--;
    } else {
        printf("Record not found, sweetie!\n");
    }
}

// Function to update a record by ID
void update_record(int id, const char *new_name) {
    Record *record = find_record(id);
    if (record != NULL) {
        strncpy(record->name, new_name, MAX_NAME_LENGTH);
    } else {
        printf("Record not found, darling!\n");
    }
}

// Main function to drive the program
int main() {
    int choice, id;
    char name[MAX_NAME_LENGTH];

    while (1) {
        printf("\nSimple Database Menu:\n");
        printf("1. Add Record\n");