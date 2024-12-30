#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is a simple database that allows you to add, search, and delete records.
// It is designed to be a delightful experience for those who love to code and enjoy the beauty of C programming.
// The program uses regular expressions to validate input and ensure that only valid data is stored in the database.
// Let's embark on this journey together and create something beautiful!

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50
#define MAX_EMAIL_LENGTH 100

typedef struct {
    char name[MAX_NAME_LENGTH];
    char email[MAX_EMAIL_LENGTH];
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a record to the database
void add_record(const char *name, const char *email) {
    if (record_count >= MAX_RECORDS) {
        printf("Database is full, cannot add more records.\n");
        return;
    }

    // Validate name using regular expressions
    regex_t regex;
    int reti;
    reti = regcomp(&regex, "^[A-Za-z ]+$", 0);
    if (reti) {
        printf("Could not compile regex\n");
        return;
    }
    reti = regexec(&regex, name, 0, NULL, 0);
    if (reti) {
        printf("Invalid name format.\n");
        regfree(&regex);
        return;
    }
    regfree(&regex);

    // Validate email using regular expressions
    reti = regcomp(&regex, "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$", 0);
    if (reti) {
        printf("Could not compile regex\n");
        return;
    }
    reti = regexec(&regex, email, 0, NULL, 0);
    if (reti) {
        printf("Invalid email format.\n");
        regfree(&regex);
        return;
    }
    regfree(&regex);

    // Add the record to the database
    strcpy(database[record_count].name, name);
    strcpy(database[record_count].email, email);
    record_count++;
    printf("Record added successfully.\n");
}

// Function to search for a record by name
void search_record(const char *name) {
    for (int i = 0; i < record_count; i++) {
        if (strcmp(database[i].name, name) == 0) {
            printf("Record found: %s, %s\n", database[i].name, database[i].email);
            return;
        }
    }
    printf("Record not found.\n");
}

// Function to delete a record by name
void