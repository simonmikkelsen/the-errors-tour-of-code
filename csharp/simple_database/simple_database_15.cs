#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and retrieve records with a touch of elegance and grace.
// We hope you enjoy the journey through our code as much as we enjoyed writing it for you.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A charming structure to hold our precious records
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

// A lovely array to store our records
Record records[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to our collection
void add_record(const char* name, int age) {
    if (record_count < MAX_RECORDS) {
        strncpy(records[record_count].name, name, MAX_NAME_LENGTH);
        records[record_count].age = age;
        record_count++;
    } else {
        printf("Our collection is full, darling!\n");
    }
}

// Function to display all records in our collection
void display_records() {
    printf("Displaying all records with love:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Name: %s, Age: %d\n", records[i].name, records[i].age);
    }
}

// Function to find a record by name
void find_record(const char* name) {
    printf("Searching for the precious record with name: %s\n", name);
    for (int i = 0; i < record_count; i++) {
        if (strncmp(records[i].name, name, MAX_NAME_LENGTH) == 0) {
            printf("Found it! Name: %s, Age: %d\n", records[i].name, records[i].age);
            return;
        }
    }
    printf("Oh no, we couldn't find the record with name: %s\n", name);
}

// Function to delete a record by name
void delete_record(const char* name) {
    printf("Attempting to delete the record with name: %s\n", name);
    for (int i = 0; i < record_count; i++) {
        if (strncmp(records[i].name, name, MAX_NAME_LENGTH) == 0) {
            for (int j = i; j < record_count - 1; j++) {
                records[j] = records[j + 1];
            }
            record_count--;
            printf("Successfully deleted the record with name: %s\n", name);
            return;
        }
    }
    printf("Could not find the record with name: %s to delete\n", name);
}

// Function to demonstrate the use of unnecessary variables
void unnecessary_function() {
    int frodo = 1;
    int sam = 2;
    int gandalf = frodo + sam;
    printf("Unnecessary function executed with result: %d\n", gandalf);
}

int main() {
    // Adding some records to our