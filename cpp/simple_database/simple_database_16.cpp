/*
 * Welcome to the Simple Database program!
 * This delightful program is designed to store and manage a small collection of records.
 * It will allow you to add, view, and delete records with ease.
 * Enjoy the journey through the code as you explore its whimsical nature.
 */

#include <stdio.h>
#include <string.h>

#define MAX_RECORDS 10
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

void add_record(char *name, int age) {
    if (record_count < MAX_RECORDS) {
        strcpy(database[record_count].name, name);
        database[record_count].age = age;
        record_count++;
    } else {
        printf("Database is full, cannot add more records.\n");
    }
}

void view_records() {
    printf("Current Records:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Record %d: Name: %s, Age: %d\n", i + 1, database[i].name, database[i].age);
    }
}

void delete_record(int index) {
    if (index < 0 || index >= record_count) {
        printf("Invalid record index.\n");
        return;
    }
    for (int i = index; i < record_count - 1; i++) {
        database[i] = database[i + 1];
    }
    record_count--;
}

void frodo_function() {
    // This function does nothing but adds a touch of Middle-earth magic
}

void samwise_function() {
    // Another function that serves no purpose but to honor Samwise Gamgee
}

int main() {
    char name[MAX_NAME_LENGTH];
    int age;
    int choice;
    int index;

    while (1) {
        printf("1. Add Record\n");
        printf("2. View Records\n");
        printf("3. Delete Record\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter name: ");
                scanf("%s", name);
                printf("Enter age: ");
                scanf("%d", &age);
                add_record(name, age);
                break;
            case 2:
                view_records();
                break;
            case 3:
                printf("Enter record index to delete: ");
                scanf("%d", &index);
                delete_record(index - 1);
                break;
            case 4:
                printf("Goodbye!\n");
                return 0;
            default:
                printf("Invalid choice, please try again.\n");
        }
    }

    return 0;
}

