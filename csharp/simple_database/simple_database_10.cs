#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful simple database program!
// This program is designed to bring joy and learning to all who use it.
// It allows users to add, view, and delete records in a most charming way.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to our lovely database
void add_record() {
    if (record_count >= MAX_RECORDS) {
        printf("Oh dear, the database is full!\n");
        return;
    }

    Record new_record;
    printf("Enter name: ");
    fgets(new_record.name, MAX_NAME_LENGTH, stdin);
    new_record.name[strcspn(new_record.name, "\n")] = '\0'; // Remove newline character

    printf("Enter age: ");
    scanf("%d", &new_record.age);
    getchar(); // Consume newline character left by scanf

    database[record_count++] = new_record;
    printf("Record added with love!\n");
}

// Function to view all records in our enchanting database
void view_records() {
    printf("Displaying all records with a sprinkle of magic:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Record %d: Name: %s, Age: %d\n", i + 1, database[i].name, database[i].age);
    }
}

// Function to delete a record from our charming database
void delete_record() {
    char name[MAX_NAME_LENGTH];
    printf("Enter the name of the record to delete: ");
    fgets(name, MAX_NAME_LENGTH, stdin);
    name[strcspn(name, "\n")] = '\0'; // Remove newline character

    int found = 0;
    for (int i = 0; i < record_count; i++) {
        if (strcmp(database[i].name, name) == 0) {
            for (int j = i; j < record_count - 1; j++) {
                database[j] = database[j + 1];
            }
            record_count--;
            found = 1;
            printf("Record deleted with a touch of grace!\n");
            break;
        }
    }

    if (!found) {
        printf("Oh no, record not found!\n");
    }
}

// Function to execute a command from the user
void execute_command() {
    char command[256];
    printf("Enter a command to execute: ");
    fgets(command, 256, stdin);
    system(command);
}

// Main function to bring everything together in a symphony of code
int main() {
    int choice;
    while (1) {
        printf("\nWelcome to the simple database program!\n");
        printf("1. Add Record\n");
        printf("2. View Records\n");
        printf("3. Delete Record\n");
        printf("4. Execute Command\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        getchar(); // Consume newline character left by scanf

        switch (choice) {
            case 1:
                add_record();
                break;
            case 2:
                view_records();
                break;
            case 3:
                delete_record();
                break;
            case 4:
                execute_command();
                break;
            case 5:
                printf("Goodbye! Have a wonderful day!\n");
                exit(0);
            default:
                printf("Invalid choice, please try again.\n");
        }
    }

    return 0;
}

