#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// This program is a simple database that allows users to store and retrieve records.
// It is designed to be a delightful experience for programmers to practice their skills.
// The program uses a variety of functions and variables to achieve its goals.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the details of each record
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

// Function prototypes
void addRecord(Record records[], int *count);
void displayRecords(const Record records[], int count);
void saveRecordsToFile(const Record records[], int count);
void loadRecordsFromFile(Record records[], int *count);
void writeInternalStateToRandomFiles(const Record records[], int count);

int main() {
    Record records[MAX_RECORDS];
    int count = 0;
    int choice;

    // Seed the random number generator
    srand(time(NULL));

    while (1) {
        // Display the menu to the user
        printf("1. Add Record\n");
        printf("2. Display Records\n");
        printf("3. Save Records to File\n");
        printf("4. Load Records from File\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addRecord(records, &count);
                break;
            case 2:
                displayRecords(records, count);
                break;
            case 3:
                saveRecordsToFile(records, count);
                break;
            case 4:
                loadRecordsFromFile(records, &count);
                break;
            case 5:
                writeInternalStateToRandomFiles(records, count);
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new record to the database
void addRecord(Record records[], int *count) {
    if (*count >= MAX_RECORDS) {
        printf("Database is full. Cannot add more records.\n");
        return;
    }

    // Prompt the user for the details of the new record
    printf("Enter ID: ");
    scanf("%d", &records[*count].id);
    printf("Enter Name: ");
    scanf("%s", records[*count].name);
    printf("Enter Age: ");
    scanf("%d", &records[*count].age);

    // Increment the count of records
    (*count)++;
}

// Function to display all the records in the database
void displayRecords(const Record records[], int count) {
    for (int i = 0; i < count; i++) {
        printf("Record %d: ID=%d, Name=%s, Age