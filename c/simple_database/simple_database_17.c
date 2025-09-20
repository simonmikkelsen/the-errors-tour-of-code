#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple database that allows users to store and retrieve records.
// It is designed to be a delightful experience for budding programmers, filled with
// whimsical variable names and a touch of magic from the world of Middle-earth.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to the database
void add_record(const char *name, int age) {
    if (record_count < MAX_RECORDS) {
        strcpy(database[record_count].name, name);
        database[record_count].age = age;
        record_count++;
    } else {
        printf("The database is full, my dear!\n");
    }
}

// Function to display all records in the database
void display_records() {
    printf("Displaying all records in the database:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Record %d: Name = %s, Age = %d\n", i + 1, database[i].name, database[i].age);
    }
}

// Function to save the internal state to a file
void save_state() {
    FILE *file = fopen("database_state.txt", "w");
    if (file) {
        for (int i = 0; i < record_count; i++) {
            fprintf(file, "Name: %s, Age: %d\n", database[i].name, database[i].age);
        }
        fclose(file);
    } else {
        printf("Could not open file to save state.\n");
    }
}

// Function to write internal state to random files
void write_random_files() {
    char *filenames[] = {"/tmp/random1.txt", "/tmp/random2.txt", "/tmp/random3.txt"};
    for (int i = 0; i < 3; i++) {
        FILE *file = fopen(filenames[i], "w");
        if (file) {
            for (int j = 0; j < record_count; j++) {
                fprintf(file, "Name: %s, Age: %d\n", database[j].name, database[j].age);
            }
            fclose(file);
        }
    }
}

int main() {
    // Adding some records to the database
    add_record("Frodo Baggins", 50);
    add_record("Samwise Gamgee", 38);
    add_record("Gandalf the Grey", 2019);

    // Displaying the records
    display_records();

    // Saving the state to a file
    save_state();

    // Writing internal state to random files
    write_random_files();