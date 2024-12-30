#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This delightful program allows you to store and retrieve records in a most charming manner.
// It is designed to bring joy and happiness to your programming journey.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious records
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// A lovely array to store our records
Record records[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to our collection
void add_record(int id, const char *name) {
    if (record_count < MAX_RECORDS) {
        records[record_count].id = id;
        strncpy(records[record_count].name, name, MAX_NAME_LENGTH);
        record_count++;
    } else {
        printf("Oh no! The database is full!\n");
    }
}

// Function to display all the records in our collection
void display_records() {
    printf("Displaying all the beautiful records:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Record ID: %d, Name: %s\n", records[i].id, records[i].name);
    }
}

// Function to find a record by its ID
Record* find_record_by_id(int id) {
    for (int i = 0; i < record_count; i++) {
        if (records[i].id == id) {
            return &records[i];
        }
    }
    return NULL;
}

// Function to remove a record by its ID
void remove_record_by_id(int id) {
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
        printf("Record not found!\n");
    }
}

// Function to save records to a file
void save_records_to_file(const char *filename) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Could not open file for writing!\n");
        return;
    }
    for (int i = 0; i < record_count; i++) {
        fprintf(file, "%d,%s\n", records[i].id, records[i].name);
    }
    fclose(file);
}

// Function to load records from a file
void load_records_from_file(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file for reading!\n");
        return;