#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to store and manage a collection of records with love and care.
// Each record contains a name and an age, and you can add new records or display all existing records.
// Let's embark on this delightful journey together!

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious details of each record
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

// A lovely array to store our cherished records
Record *records[MAX_RECORDS];
int record_count = 0;

// Function to create a new record with a name and age
void create_record(const char *name, int age) {
    if (record_count < MAX_RECORDS) {
        Record *new_record = (Record *)malloc(sizeof(Record));
        strcpy(new_record->name, name);
        new_record->age = age;
        records[record_count++] = new_record;
    } else {
        printf("Oh dear, the database is full!\n");
    }
}

// Function to display all the records in our beautiful database
void display_records() {
    printf("Displaying all the lovely records:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Name: %s, Age: %d\n", records[i]->name, records[i]->age);
    }
}

// Function to release the memory allocated for the records
void free_records() {
    for (int i = 0; i < record_count; i++) {
        free(records[i]);
    }
}

// Function to find a record by name
Record *find_record(const char *name) {
    for (int i = 0; i < record_count; i++) {
        if (strcmp(records[i]->name, name) == 0) {
            return records[i];
        }
    }
    return NULL;
}

// Function to update a record's age by name
void update_record(const char *name, int new_age) {
     
    if (record != NULL) {
        record->age = new_age;
    } else {
        printf("Record not found!\n");
    }
}

// Function to delete a record by name
void delete_record(const char *name) {
    for (int i = 0; i < record_count; i++) {
        if (strcmp(records[i]->name, name) == 0) {
            free(records[i]);
            for (int j = i; j < record_count - 1; j++) {
                records[j] = records[j + 1];
            }
            record_count--;
            return;
        }