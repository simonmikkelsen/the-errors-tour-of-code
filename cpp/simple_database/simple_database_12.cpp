#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Oh gentle reader, this program doth serve as a simple database
// To store and retrieve records with grace and elegance
// In the memory of our fair machine, we shall keep our data
// And write functions to add, display, and remove records

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the beauty of a single record
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// A collection of records, like a garden of blooming flowers
Record records[MAX_RECORDS];
int record_count = 0;

// A function to add a new record to our garden
void add_record(int id, const char *name) {
    if (record_count < MAX_RECORDS) {
        records[record_count].id = id;
        strncpy(records[record_count].name, name, MAX_NAME_LENGTH);
        record_count++;
    } else {
        printf("The garden is full, no more records can be added.\n");
    }
}

// A function to display the beauty of all records
void display_records() {
    for (int i = 0; i < record_count; i++) {
        printf("ID: %d, Name: %s\n", records[i].id, records[i].name);
    }
}

// A function to remove a record by its ID, like plucking a weed from the garden
void remove_record(int id) {
    int found = 0;
    for (int i = 0; i < record_count; i++) {
        if (records[i].id == id) {
            found = 1;
            for (int j = i; j < record_count - 1; j++) {
                records[j] = records[j + 1];
            }
            record_count--;
            break;
        }
    }
    if (!found) {
        printf("No record with ID %d found in the garden.\n", id);
    }
}

// A function to search for a record by its ID, like seeking a rare flower
Record* search_record(int id) {
    for (int i = 0; i < record_count; i++) {
        if (records[i].id == id) {
            return &records[i];
        }
    }
    return NULL;
}

// The main function, where our journey begins
int main() {
    // Adding some records to our garden
    add_record(1, "Frodo