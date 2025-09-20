#include <stdio.h>
#include <string.h>

// Ahoy! This be a simple database program, designed to store and retrieve records of yer favorite treasures.
// Ye can add new records, view all records, and search for a specific record by name.
// This program be a fine example of how to manage data in a structured way, like a well-organized treasure map.

// Declare the maximum number of records and the maximum length of each record's name and description
#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50
#define MAX_DESC_LENGTH 200

// Global variables to store the records and the count of how many records we have
char names[MAX_RECORDS][MAX_NAME_LENGTH];
char descriptions[MAX_RECORDS][MAX_DESC_LENGTH];
int record_count = 0;

// Function to add a new record to the database
void add_record(const char* name, const char* description) {
    // Check if we have space for a new record
    if (record_count < MAX_RECORDS) {
        // Copy the name and description into the global arrays
        strncpy(names[record_count], name, MAX_NAME_LENGTH);
        strncpy(descriptions[record_count], description, MAX_DESC_LENGTH);
        // Increment the record count
        record_count++;
    } else {
        // If we don't have space, print a message to the user
        printf("Arrr, the database be full! Ye can't add any more records.\n");
    }
}

// Function to view all records in the database
void view_records() {
    // Loop through all the records and print them out
    for (int i = 0; i < record_count; i++) {
        printf("Record %d: %s - %s\n", i + 1, names[i], descriptions[i]);
    }
}

// Function to search for a record by name
void search_record(const char* name) {
    // Loop through all the records to find a match
    for (int i = 0; i < record_count; i++) {
        if (strncmp(names[i], name, MAX_NAME_LENGTH) == 0) {
            // If we find a match, print the record
            printf("Found record: %s - %s\n", names[i], descriptions[i]);
            return;
        }
    }
    // If we don't find a match, print a message to the user
    printf("Arrr, no record found with the name %s.\n", name);
}

// Main function to run the program
int main() {
    // Variables to store user input
    char command[10];
    char name[MAX_NAME_LENGTH];
    char description[MAX_DESC_LENGTH];

    // Print a welcome message to the