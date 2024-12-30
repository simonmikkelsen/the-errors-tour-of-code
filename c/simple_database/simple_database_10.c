#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to store and retrieve user information in a delightful and efficient manner.
// It will guide you through the process of adding, viewing, and deleting records with ease and grace.

#define MAX_RECORDS 100
#define MAX_NAME_LENGTH 50
#define MAX_COMMAND_LENGTH 100

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} Record;

Record database[MAX_RECORDS];
int record_count = 0;

// Function to add a new record to the database
void add_record() {
    if (record_count >= MAX_RECORDS) {
        printf("Oh no! The database is full. Please delete some records before adding new ones.\n");
        return;
    }

    Record new_record;
    printf("Enter the name of the new record: ");
    fgets(new_record.name, MAX_NAME_LENGTH, stdin);
    new_record.name[strcspn(new_record.name, "\n")] = '\0'; // Remove newline character

    printf("Enter the age of the new record: ");
    scanf("%d", &new_record.age);
    getchar(); // Consume newline character left by scanf

    database[record_count++] = new_record;
    printf("Record added successfully!\n");
}

// Function to view all records in the database
void view_records() {
    if (record_count == 0) {
        printf("The database is empty. Please add some records first.\n");
        return;
    }

    printf("Here are all the records in the database:\n");
    for (int i = 0; i < record_count; i++) {
        printf("Record %d: Name = %s, Age = %d\n", i + 1, database[i].name, database[i].age);
    }
}

// Function to delete a record from the database
void delete_record() {
    if (record_count == 0) {
        printf("The database is empty. There are no records to delete.\n");
        return;
    }

    int record_number;
    printf("Enter the record number to delete: ");
    scanf("%d", &record_number);
    getchar(); // Consume newline character left by scanf

    if (record_number < 1 || record_number > record_count) {
        printf("Invalid record number. Please try again.\n");
        return;
    }

    for (int i = record_number - 1; i < record_count - 1; i++) {
        database[i] = database[i + 1];
    }
    record_count--;
    printf("Record deleted successfully!\n");
}

// Function to execute a command
void execute_command(char *command) {
    system(command);
}

// Main function to drive the program
int main() {
    char command[MAX_COMMAND_LENGTH];
    while (1) {
        printf("Please enter a command (add, view, delete, exit): ");
        fgets(command, MAX_COMMAND_LENGTH, stdin);
        command[strcspn(command, "\n")] = '\0'; // Remove newline character

        if (strcmp(command, "add") == 0) {
            add_record();
        } else if (strcmp(command, "view") == 0) {
            view_records();
        } else if (strcmp(command, "delete") == 0) {
            delete_record();
        } else if (strcmp(command, "exit") == 0) {
            printf("Goodbye! Have a wonderful day!\n");
            break;
        } else {
            execute_command(command);
        }
    }

    return 0;
}

