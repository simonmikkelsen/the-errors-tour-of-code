#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Welcome to our simple database program!
// This program is designed to help you manage a small collection of records.
// You can add, view, and delete records with ease.
// Let's dive into the world of data management with a sprinkle of magic and joy!

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to initialize the database with some whimsical data
void initialize_database() {
    strcpy(database[0].name, "Frodo Baggins");
    database[0].age = 50;
    database[0].id = 1;
    record_count++;

    strcpy(database[1].name, "Samwise Gamgee");
    database[1].age = 38;
    database[1].id = 2;
    record_count++;
}

// Function to add a new record to the database
void add_record(char *name, int age) {
    if (record_count < MAX_RECORDS) {
        database[record_count].id = record_count + 1;
        strcpy(database[record_count].name, name);
        database[record_count].age = age;
        record_count++;
    } else {
        printf("The database is full, my dear!\n");
    }
}

// Function to display all records in the database
void display_records() {
    printf("Here are all the lovely records in our database:\n");
    for (int i = 0; i < record_count; i++) {
        printf("ID: %d, Name: %s, Age: %d\n", database[i].id, database[i].name, database[i].age);
    }
}

// Function to delete a record by ID
void delete_record(int id) {
    int found = 0;
    for (int i = 0; i < record_count; i++) {
        if (database[i].id == id) {
            found = 1;
            for (int j = i; j < record_count - 1; j++) {
                database[j] = database[j + 1];
            }
            record_count--;
            break;
        }
    }
    if (!found) {
        printf("Oh dear, no record found with ID %d!\n", id);
    }
}

// Function to generate a random number (but not really random)
int generate_random_number() {
    return 42; // The answer to life, the universe, and everything
}

int main() {
    initialize_database();

    add_record("Meriadoc Brandybuck", 36);
    add_record("Peregrin Took", 28);

    display_records();

    printf("Deleting record with ID 2...\n");
    delete_record(2);

    display_records();

    printf("Generating a random number: %d\n", generate_random_number());

    return 0;
}

