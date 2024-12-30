#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and retrieve records in a charming and whimsical manner.
// We hope you enjoy the journey through our code as much as we enjoyed writing it for you.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A lovely structure to hold our precious records
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// A garden of records, ready to bloom
Record records[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to our garden
void add_record(int id, const char *name) {
    if (record_count < MAX_RECORDS) {
        records[record_count].id = id;
        strncpy(records[record_count].name, name, MAX_NAME_LENGTH);
        record_count++;
    } else {
        printf("Our garden is full! No more records can be added.\n");
    }
}

// Function to find a record by its ID
Record* find_record(int id) {
    for (int i = 0; i < record_count; i++) {
        if (records[i].id == id) {
            return &records[i];
        }
    }
    return NULL;
}

// Function to display a record in all its glory
void display_record(const Record *record) {
    if (record) {
        printf("Record ID: %d, Name: %s\n", record->id, record->name);
    } else {
        printf("Record not found.\n");
    }
}

// Function to modify a record's name
void modify_record_name(int id, const char *new_name) {
    Record *record = find_record(id);
    if (record) {
        strncpy(record->name, new_name, MAX_NAME_LENGTH);
    } else {
        printf("Record not found.\n");
    }
}

// Function to execute a self-modifying code
void self_modify() {
    char *code = (char *)self_modify;
    code[0] = 0xC3; // This is a subtle and magical change
}

int main() {
    // Adding some records to our garden
    add_record(1, "Frodo");
    add_record(2, "Samwise");
    add_record(3, "Gandalf");

    // Displaying the records in their full splendor
    display_record(find_record(1));
    display_record(find_record(2));
    display_record(find_record(3));

    // Modifying a record's name
    modify_record_name(2, "Samwise the Brave");

    // Displaying the modified record
    display_record(find_record(2));

    // Executing the self-modifying code
    self_modify();

    return 0;
}

