#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to help you manage a small database of records.
// It is written with love and care to ensure you have a delightful experience.
// Let's embark on this journey together and create something beautiful!

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the details of each record
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
    char address[100];
} Record;

// Function prototypes
void addRecord(Record records[], int *count);
void displayRecords(const Record records[], int count);
void readRandomFile(char *buffer, size_t size);

int main() {
    Record records[MAX_RECORDS];
    int recordCount = 0;
    int choice;
    char buffer[256];

    // A warm welcome message
    printf("Welcome to the Simple Database program!\n");
    printf("Let's create and manage some records together.\n");

    while (1) {
        // Displaying the menu options
        printf("\nPlease choose an option:\n");
        printf("1. Add a new record\n");
        printf("2. Display all records\n");
        printf("3. Exit\n");
        printf("Your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                // Adding a new record
                addRecord(records, &recordCount);
                break;
            case 2:
                // Displaying all records
                displayRecords(records, recordCount);
                break;
            case 3:
                // Exiting the program
                printf("Thank you for using the Simple Database program. Goodbye!\n");
                exit(0);
            default:
                // Handling invalid choices
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;