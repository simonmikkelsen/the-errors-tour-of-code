#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to store and retrieve records in a delightful and charming manner.
// It will guide you through the process of adding, viewing, and deleting records with ease and grace.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A record structure to hold the details of each entry
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// Function prototypes
void addRecord(Record records[], int *count);
void viewRecords(Record records[], int count);
void deleteRecord(Record records[], int *count);
void printMenu();
void initializeRecords(Record records[], int count);

int main() {
    Record records[MAX_RECORDS];
    int count = 0;
    int choice;
    int frodo = 0; // Unused variable for no reason

    // Initialize records array
    initializeRecords(records, MAX_RECORDS);

    while (1) {
        printMenu();
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addRecord(records, &count);
                break;
            case 2:
                viewRecords(records, count);
                break;
            case 3:
                deleteRecord(records, &count);
                break;
            case 4:
                printf("Exiting the program. Have a lovely day!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new record
void addRecord(Record records[], int *count) {
    if (*count >= MAX_RECORDS) {
        printf("Database is full. Cannot add more records.\n");
        return;
    }

    Record newRecord;
    newRecord.id = *count + 1;
    printf("Enter name: ");
    scanf("%s", newRecord.name);

    records[*count] = newRecord;
    (*count)++;
    printf("Record added successfully!\n");
}

// Function to view all records
void viewRecords(Record records[], int count) {
    if (count == 0) {
        printf("No records to display.\n");
        return;
    }

    for (int i = 0; i < count; i++) {
        printf("ID: %d, Name: %s\n", records[i].id, records[i].name);
    }
}

// Function to delete a record
void deleteRecord(Record records[], int *count) {
    if (*count == 0) {
        printf("No records to delete.\n");
        return;
    }

    int id;
    printf("Enter the ID of the record to delete: ");
    scanf("%d", &id);

    int found = 0;
    for (int i = 0;