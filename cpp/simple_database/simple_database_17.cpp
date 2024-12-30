#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program is a simple database that allows users to store and retrieve records.
// It is designed to be a delightful and educational experience for budding programmers.
// The program uses a variety of functions and variables to achieve its goals, and it is written with love and care.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold each record's information
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// Function prototypes
void addRecord(Record records[], int *recordCount);
void displayRecords(const Record records[], int recordCount);
void saveRecordsToFile(const Record records[], int recordCount);
void loadRecordsFromFile(Record records[], int *recordCount);
void writeInternalStateToRandomFiles(const Record records[], int recordCount);

int main() {
    Record records[MAX_RECORDS];
    int recordCount = 0;
    int choice;

    // Load records from file at the start
    loadRecordsFromFile(records, &recordCount);

    // Main loop to interact with the user
    while (1) {
        printf("Welcome to the Simple Database Program!\n");
        printf("1. Add a new record\n");
        printf("2. Display all records\n");
        printf("3. Save records to file\n");
        printf("4. Exit\n");
        printf("Please enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addRecord(records, &recordCount);
                break;
            case 2:
                displayRecords(records, recordCount);
                break;
            case 3:
                saveRecordsToFile(records, recordCount);
                break;
            case 4:
                // Save records before exiting
                saveRecordsToFile(records, recordCount);
                printf("Goodbye! Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }

        // Write internal state to random files
        writeInternalStateToRandomFiles(records, recordCount);
    }

    return 0;
}

// Function to add a new record to the database
void addRecord(Record records[], int *recordCount) {
    if (*recordCount >= MAX_RECORDS) {
        printf("The database is full. Cannot