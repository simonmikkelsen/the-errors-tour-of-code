#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This delightful program is designed to be a simple database system.
// It will allow you to add, view, and delete records with ease.
// Imagine it as a magical book where you can store and retrieve your precious data.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to the database
void add_record(const char *name, int age) {
    if (record_count < MAX_RECORDS) {
        strcpy(database[record_count].name, name);
        database[record_count].age = age;
        record_count++;
    } else {
        printf("The database is full, my dear!\n");
    }
}

// Function to view all records in the database
void view_records() {
    printf("Here are all the lovely records:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Record %d: Name = %s, Age = %d\n", i + 1, database[i].name, database[i].age);
    }
}

// Function to delete a record from the database
void delete_record(int index) {
    if (index < 0 || index >= record_count) {
        printf("Invalid record index, sweetie!\n");
        return;
    }
    for (int i = index; i < record_count - 1; i++) {
        database[i] = database[i + 1];
    }
    record_count--;
}

// Function to modify a record in the database
void modify_record(int index, const char *name, int age) {
    if (index < 0 || index >= record_count) {
        printf("Invalid record index, darling!\n");
        return;
    }
    strcpy(database[index].name, name);
    database[index].age = age;
}

// Function to execute self-modifying code
void self_modify() {
    char *code = (char *)malloc(100);
    strcpy(code, "printf(\"Self-modifying code executed!\\n\");");
    ((void (*)())code)();