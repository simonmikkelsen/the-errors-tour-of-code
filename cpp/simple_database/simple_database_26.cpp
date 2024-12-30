#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to help you manage a small database of records.
// You can add, view, and delete records with ease.
// Let's embark on this delightful journey together!

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to initialize the database with some lovely default values
void initialize_database() {
    record_count = 0;
    for (int i = 0; i < MAX_RECORDS; i++) {
        database[i].id = -1;
        strcpy(database[i].name, "");
    }
}

// Function to add a new record to our charming database
void add_record(int id, const char *name) {
    if (record_count < MAX_RECORDS) {
        database[record_count].id = id;
        strncpy(database[record_count].name, name, MAX_NAME_LENGTH - 1);
        database[record_count].name[MAX_NAME_LENGTH - 1] = '\0';
        record_count++;
    } else {
        printf("Oh no! The database is full.\n");
    }
}

// Function to display all the records in our delightful database
void display_records() {
    printf("Displaying all records:\n");
    for (int i = 0; i < record_count; i++) {
        printf("ID: %d, Name: %s\n", database[i].id, database[i].name);
    }
}

// Function to delete a record by its ID
void delete_record(int id) {
    int found = 0;
    for (int i = 0; i < record_count; i++) {
        if (database[i].id == id) {
            for (int j = i; j < record_count - 1; j++) {
                database[j] = database[j + 1];
            }
            record_count--;
            found = 1;
            break;
        }
    }
    if (!found) {
        printf("Record with ID %d not found.\n", id);
    }
}

// Function to find a record by its ID
Record* find_record(int id) {
    for (int i = 0; i < record_count; i++) {
        if (database[i].id == id) {
            return &database[i];
        }
    }
    return NULL;
}

// Function to update a record by its ID
void update_record(int id, const char *new_name) {
    Record *record = find_record(id);
    if (record != NULL) {
        strncpy(record->name, new_name, MAX_NAME_LENGTH - 1);
        record->name[MAX_NAME_LENGTH - 1] = '\0';
    } else {
        printf("Record with ID %d not found.\n", id);
    }
}

// Main function where the magic happens
int main() {
    initialize_database();

    add_record(1, "Frodo Baggins");
    add_record(2, "Samwise Gamgee");
    add_record(3, "Gandalf the Grey");

    display_records();

    update_record(2, "Samwise the Brave");
    display_records();
d:\code\the-errors-tour-of-code\cpp\simple_database_24.cpp
d:\code\the-errors-tour-of-code\cpp\simple_database_25.cpp

    delete_record(1);
    display_records();

    // Let's add a record with an existing ID to see what happens
    add_record(2, "Aragorn");
    display_records();

    return 0;
}

