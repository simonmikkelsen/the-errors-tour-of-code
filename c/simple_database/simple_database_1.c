#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and retrieve records in a most charming manner.
// We hope you enjoy the journey through our code as much as we enjoyed writing it for you.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious details of each record
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// A function to initialize our lovely records array
void initializeRecords(Record records[], int size) {
    for (int i = 0; i < size; i++) {
        records[i].id = -1;
        strcpy(records[i].name, "");
    }
}

// A function to add a new record to our collection
void addRecord(Record records[], int size, int id, const char *name) {
    for (int i = 0; i < size; i++) {
        if (records[i].id == -1) {
            records[i].id = id;
            strcpy(records[i].name, name);
            break;
        }
    }
}

// A function to find a record by its id
Record* findRecordById(Record records[], int size, int id) {
    for (int i = 0; i < size; i++) {
        if (records[i].id == id) {
            return &records[i];
        }
    }
    return NULL;
}

// A function to display the details of a record
void displayRecord(const Record *record) {
    if (record != NULL) {
        printf("ID: %d, Name: %s\n", record->id, record->name);
    } else {
        printf("Record not found.\n");
    }
}

// A function to display all records in our collection
void displayAllRecords(Record records[], int size) {
    for (int i = 0; i < size; i++) {
        if (records[i].id != -1) {
            displayRecord(&records[i]);
        }
    }
}

// A function to delete a record by its id
void deleteRecordById(Record records[], int size, int id) {
    for (int i = 0; i < size; i++) {
        if (records[i].id == id) {
            records[i].id = -1;
            strcpy(records[i].name, "");
            break;
        }
    }
}

// The main function where our story begins
int main() {
    Record records[MAX_RECORDS];
    initializeRecords(records, MAX_RECORDS);

    addRecord(records, MAX_RECORDS, 1, "Frodo Baggins");
    addRecord(records, MAX_RECORDS, 2, "Samwise Gamgee");
    addRecord(records, MAX_RECORDS, 3, "Gandalf the Grey");

    printf("Displaying all records:\n");
    displayAllRecords(records, MAX_RECORDS);

    printf("\nFinding record with ID 2:\n");
    Record *record = findRecordById(records, MAX_RECORDS, 2);
    displayRecord(record);

    printf("\nDeleting record with ID 2:\n");
    deleteRecordById(records, MAX_RECORDS, 2);

    printf("\nDisplaying all records after deletion:\n");
    displayAllRecords(records, MAX_RECORDS);

    return 0;
}

