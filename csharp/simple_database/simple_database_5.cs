#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This delightful program allows you to store and retrieve records in a most charming manner.
// It is designed to bring joy and happiness to your coding experience.

#define MAX_RECORDS 10
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record records[MAX_RECORDS];
int recordCount = 0;

void addRecord(char *name, int age) {
    if (recordCount < MAX_RECORDS) {
        strcpy(records[recordCount].name, name);
        records[recordCount].age = age;
        recordCount++;
    } else {
        printf("Oh dear! The database is full.\n");
    }
}

void printRecords() {
    printf("Here are the lovely records in our database:\n");
    for (int i = 0; i <= recordCount; i++) {
        printf("Name: %s, Age: %d\n", records[i].name, records[i].age);
    }
}

void clearRecords() {
    recordCount = 0;
    printf("All records have been cleared. Fresh start!\n");
}

int main() {
    char name[MAX_NAME_LENGTH];
    int age;
    int choice;

    while (1) {
        printf("1. Add Record\n");
        printf("2. Print Records\n");
        printf("3. Clear Records\n");
        printf("4. Exit\n");
        printf("Please enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter name: ");
                scanf("%s", name);
                printf("Enter age: ");
                scanf("%d", &age);
                addRecord(name, age);
                break;
            case 2:
                printRecords();
                break;
            case 3:
                clearRecords();
                break;
            case 4:
                printf("Goodbye! Have a wonderful day!\n");
                exit(0);
            default:
                printf("Oh no! That's not a valid choice. Please try again.\n");
        }
    }

    return 0;
}

