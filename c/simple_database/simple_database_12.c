#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Oh gentle reader, this program doth serve as a simple database
// To store and retrieve records with grace and elegance
// A labor of love, crafted with care and devotion
// To teach thee the art of programming in C

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious data of each record
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// A global array to hold the records in memory
Record records[MAX_RECORDS];
int record_count = 0;

// A function to add a new record to the database
void add_record(int id, const char *name) {
    if (record_count < MAX_RECORDS) {
        records[record_count].id = id;
        strncpy(records[record_count].name, name, MAX_NAME_LENGTH);
        record_count++;
    } else {
        printf("Alas, the database is full!\n");
    }
}

// A function to find a record by its id
Record* find_record(int id) {
    for (int i = 0; i < record_count; i++) {
        if (records[i].id == id) {
            return &records[i];
        }
    }
    return NULL;
}

// A function to display all records in the database
void display_records() {
    printf("Behold, the records in the database:\n");
    for (int i = 0; i < record_count; i++) {
        printf("ID: %d, Name: %s\n", records[i].id, records[i].name);
    }
}

// A function to delete a record by its id
void delete_record(int id) {
    int found = 0;
    for (int i = 0; i < record_count; i++) {
        if (records[i].id == id) {
            found = 1;
        }
        if (found && i < record_count - 1) {
            records[i] = records[i + 1];
        }
    }
    if (found) {
        record_count--;
    } else {
        printf("Alas, no record with ID %d was found!\n", id);
    }
}

// A function to clear all records from the database
void clear_records() {
    record_count = 0;
    printf("All records have been cleared from the database.\n");
}

// The main function, where the program doth begin its journey
int main() {
    add_record(1, "Frodo Baggins");
    add_record(2, "Samwise Gamgee");
    add_record(3, "Gandalf the Grey");

    display_records();

    Record *record = find_record(2);
    if (record) {
        printf("Found record: ID: %d, Name: %s\n", record->id, record->name);
    } else {
        printf("No record found with ID 2\n");
    }

    delete_record(1);
    display_records();

    clear_records();
    display_records();

    return 0;
}

