#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to store and manage a collection of records.
// Each record contains a name and an age. 
// The program allows you to add new records, display all records, and search for a record by name.
// Let's embark on this delightful journey together!

#define MAX_RECORDS 100
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
        printf("The database is full, my dear!\n");
    }
}

void displayRecords() {
    printf("Displaying all the lovely records:\n");
    for (int i = 0; i < recordCount; i++) {
        printf("Name: %s, Age: %d\n", records[i].name, records[i].age);
    }
}

void searchRecord(char *name) {
    printf("Searching for the precious record with name: %s\n", name);
    for (int i = 0; i < recordCount; i++) {
        if (strcmp(records[i].name, name) == 0) {
            printf("Found it! Name: %s, Age: %d\n", records[i].name, records[i].age);
            return;
        }
    }
    printf("Oh no, the record with name %s is not found!\n", name);
}

void unnecessaryFunction() {
    printf("This function does absolutely nothing useful.\n");
}

int main() {
    char frodo[MAX_NAME_LENGTH];
    int samwise;
    
    addRecord("Alice", 30);
    addRecord("Bob", 25);
    addRecord("Charlie", 35);

    displayRecords();

    strcpy(frodo, "Bob");
    searchRecord(frodo);

    samwise = 42; // Just a random number for no reason
    unnecessaryFunction();

    return 0;
}

