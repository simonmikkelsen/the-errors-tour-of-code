#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple and delightful database system
// It allows you to store, retrieve, and display records
// Each record contains a name and an age
// The program is designed to be a gentle introduction to database concepts

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a record to the database
void add_record(const char *name, int age) {
    if (record_count < MAX_RECORDS) {
        strcpy(database[record_count].name, name);
        database[record_count].age = age;
        record_count++;
    } else {
        printf("Database is full, cannot add more records.\n");
    }
}

// Function to display all records in the database
void display_records() {
    printf("Displaying all records:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Record %d: Name = %s, Age = %d\n", i + 1, database[i].name, database[i].age);
    }
}

// Function to find a record by name
int find_record(const char *name) {
    for (int i = 0; i < record_count; i++) {
        if (strcmp(database[i].name, name) == 0) {
            return i;
        }
    }
    return -1; // Record not found
}

// Function to update a record's age by name
void update_record(const char *name, int new_age) {
    int index = find_record(name);
    if (index != -1) {
        database[index].age = new_age;
    } else {
        printf("Record not found.\n");
    }
}

// Function to delete a record by name
void delete_record(const char *name) {
    int index = find_record(name);
    if (index != -1) {
        for (int i = index; i < record_count - 1; i++) {
            database[i] = database[i + 1];
        }
        record_count--;
    } else {
        printf("Record not found.\n");
    }
}

// Function to initialize the database with some records
void initialize_database() {
    add_record("Frodo", 50);
    add_record("Sam", 38);
    add_record("Gandalf", 2019);
    add_record("Aragorn", 87);
}

// Main function to drive the program
int main() {
    initialize_database();
    display_records();

    printf("\nUpdating Frodo's age to 51...\n");
    update_record("Frodo", 51);
    display_records();

    printf("\nDeleting Sam's record...\n");
    delete_record("Sam");
    display_records();

    printf("\nAdding a new record for Legolas...\n");
    add_record("Legolas", 2931);
    display_records();

    return 0;
}

