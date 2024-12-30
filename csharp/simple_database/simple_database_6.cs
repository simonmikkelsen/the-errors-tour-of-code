#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to store and retrieve records in a charming and efficient manner.
// We hope you enjoy the journey through our code as much as we enjoyed writing it for you.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious details of each record
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
} Record;

// Function prototypes, because we love to be organized
void addRecord(Record records[], int *count);
void displayRecords(const Record records[], int count);
void searchRecord(const Record records[], int count, int id);

int main() {
    Record records[MAX_RECORDS];
    int count = 0;
    int choice;
    int id;

    // A warm welcome message to our users
    printf("Welcome to the Simple Database Program!\n");

    while (1) {
        // Presenting the user with a bouquet of options
        printf("\nPlease choose an option:\n");
        printf("1. Add a record\n");
        printf("2. Display all records\n");
        printf("3. Search for a record by ID\n");
        printf("4. Exit\n");
        printf("Your choice: ");
        scanf("%d", &choice);

        // Handling the user's choice with grace
        switch (choice) {
            case 1:
                addRecord(records, &count);
                break;
            case 2:
                displayRecords(records, count);
                break;
            case 3:
                printf("Enter the ID to search: ");
                scanf("%d", &id);
                searchRecord(records, count, id);
                break;
            case 4:
                printf("Thank you for using the Simple Database Program. Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new record to our lovely database
void addRecord(Record records[], int *count) {
    if (*count >= MAX_RECORDS) {
        printf("Database is full. Cannot add more records.\n");
        return;
    }

    // Gathering the details of the new record
    printf("Enter ID: ");
    scanf("%d", &records[*count].id);
    printf("Enter name: ");
    scanf("%s", records[*count].name);

    // Incrementing the count of records
    (*count)++;
    printf("Record added successfully!\n");
}

// Function to display all the records in our beautiful database
void displayRecords(const Record records[], int count) {
    if (count == 0) {
        printf("No records to display.\n");
        return;
    }

    // Displaying each record with love
    for (int i = 0; i < count; i++) {
        printf("Record %d: ID = %d, Name = %s\n", i + 1, records[i].id, records[i].name);
    }
}

// Function to search for a record by its ID
void searchRecord(const Record records[], int count, int id) {
    for (int i = 0; i < count; i++) {
        if (records[i].id == id) {
            printf("Record found: ID = %d, Name = %s\n", records[i].id, records[i].name);
            return;
        }
    }
    printf("Record not found.\n");
}

