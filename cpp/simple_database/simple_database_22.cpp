#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our simple database program!
// This program is designed to store and retrieve data with a touch of magic and elegance.
// Feel free to explore the functions and enjoy the journey through the code.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the precious data of each record
typedef struct {
    int id;
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

// Function declarations
void addRecord(Record records[], int *count);
void displayRecords(const Record records[], int count);
void searchRecord(const Record records[], int count, int id);
void deleteRecord(Record records[], int *count, int id);
void sortRecords(Record records[], int count);

int main() {
    Record records[MAX_RECORDS];
    int count = 0;
    int choice;
    int id;

    while (1) {
        printf("\nSimple Database Menu:\n");
        printf("1. Add Record\n");
        printf("2. Display Records\n");
        printf("3. Search Record\n");
        printf("4. Delete Record\n");
        printf("5. Sort Records\n");
        printf("6. Exit\n");
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
                printf("Enter ID to search: ");
                scanf("%d", &id);
                searchRecord(records, count, id);
                break;
            case 4:
                printf("Enter ID to delete: ");
                scanf("%d", &id);
                deleteRecord(records, &count, id);
                break;
            case 5:
                sortRecords(records, count);
                break;
            case 6:
                printf("Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new record to the database
void addRecord(Record records[], int *count) {
    if (*count >= MAX_RECORDS) {
        printf("Database is full! Cannot add more records.\n");
        return;
    }

    Record newRecord;
    newRecord.id = *count + 1;
    printf("Enter name: ");
    scanf("%s", newRecord.name);
    printf("Enter age: ");
    scanf("%d", &newRecord.age);

    records[*count] = newRecord;
    (*count)++;
    printf("Record added successfully!\n");
}

// Function to display all records in the database
void displayRecords(const Record records[], int count) {
    if (count == 0) {
        printf("No records to display.\n");
        return;
    }

    printf("\nDisplaying all records:\n");
    for (int i = 0; i < count; i++) {
        printf("ID: %d, Name: %s, Age: %d\n", records[i].id, records[i].name, records[i].age);
    }
}

// Function to search for a record by ID
void searchRecord(const Record records[], int count, int id) {
    for (int i