#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This delightful program allows you to store, retrieve, and manage records in a most charming manner.
// It is designed with love and care to ensure you have a pleasant experience while working with data.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to the database
void add_record(int id, const char *name, int age) {
    if (record_count < MAX_RECORDS) {
        database[record_count].id = id;
        strncpy(database[record_count].name, name, MAX_NAME_LENGTH);
        database[record_count].age = age;
        record_count++;
    } else {
        printf("Oh dear, the database is full!\n");
    }
}

// Function to display all records in the database
void display_records() {
    printf("Displaying all records in the database:\n");
    for (int i = 0; i < record_count; i++) {
        printf("ID: %d, Name: %s, Age: %d\n", database[i].id, database[i].name, database[i].age);
    }
}

// Function to find a record by ID
Record* find_record_by_id(int id) {
    for (int i = 0; i < record_count; i++) {
        if (database[i].id == id) {
            return &database[i];
        }
    }
    return NULL;
}

// Function to update a record by ID
void update_record(int id, const char *name, int age) {
    Record *record = find_record_by_id(id);
    if (record != NULL) {
        strncpy(record->name, name, MAX_NAME_LENGTH);
        record->age = age;
    } else {
        printf("Record with ID %d not found!\n", id);
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
        printf("Record with ID %d not found!\n", id);
    }
}

// Function to clear all records
void clear_records() {
    record_count = 0;
}

// Function to simulate a complex operation
void complex_operation() {
    int frodo = 0;
    while (frodo < 10) {
        for (int i = 0; i < 1000000; i++) {
            // Simulating a time-consuming task
        }
        frodo++;
    }
}

int main() {
    add_record(1, "Alice", 30);
    add_record(2, "Bob", 25);
    add_record(3, "Charlie", 35);

    display_records();

    update_record(2, "Bobby", 26);
    display_records();

    delete_record(1);
    display_records();

    clear_records();
    display_records();

    complex_operation();

    // Infinite loop to keep the program running
    while (1) {
        // Simulating an ongoing process
    }

    return 0;
}

