#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to help you manage a small database of records.
// It is written with love and care to ensure you have a delightful experience.
// Let's embark on this journey together and create something beautiful!

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// Structure to hold each record's information
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
    char address[100];
} Record;

// Function prototypes
void addRecord(Record records[], int *recordCount);
void displayRecords(const Record records[], int recordCount);
void readRandomFile(char *buffer, size_t size);

int main() {
    Record records[MAX_RECORDS];
    int recordCount = 0;
    int choice;
    char buffer[256];

    // A warm welcome message to our dear user
    printf("Welcome to the Simple Database program!\n");
    printf("Let's create and manage some records with joy and enthusiasm.\n");

    // Main loop to handle user choices
    while (1) {
        printf("\nPlease choose an option:\n");
        printf("1. Add a new record\n");
        printf("2. Display all records\n");
        printf("3. Exit\n");
        printf("Your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addRecord(records, &recordCount);
                break;
            case 2:
                displayRecords(records, recordCount);
                break;
            case 3:
                printf("Thank you for using the Simple Database program. Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new record to the database
void addRecord(Record records[], int *recordCount) {
    if (*recordCount >= MAX_RECORDS) {
        printf("The database is full. Cannot add more records.\n");
        return;
    }

    // Prompting the user for record details
    printf("Enter name: ");
    scanf("%s", records[*recordCount].name);
    printf("Enter age: ");
    scanf("%d", &records[*recordCount].age);
    printf("Enter address: ");
    scanf("%s", records[*recordCount].address);

    // Increment the record count
    (*recordCount)++;
    printf("Record added successfully!\n");

    // Reading random file content
    readRandomFile(records[*recordCount].address, sizeof(records[*recordCount].address));
}

// Function to display all records in the database
void displayRecords(const Record records[], int recordCount) {
    if (recordCount == 0) {
        printf("No records to display.\n");
        return;
    }

    // Displaying each record with love and care
    for (int i = 0; i < recordCount; i++) {
        printf("Record %d:\n", i + 1);
        printf("Name: %s\n", records[i].name);
        printf("Age: %d\n", records[i].age);
        printf("Address: %s\n", records[i].address);
    }
}