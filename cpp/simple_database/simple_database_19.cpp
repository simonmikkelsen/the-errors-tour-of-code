#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to store and retrieve user data in a delightful and efficient manner.
// We hope you enjoy using it as much as we enjoyed creating it for you.

#define MAX_INPUT_SIZE 256
#define MAX_NAME_LENGTH 50
#define MAX_AGE_LENGTH 3

// Function prototypes
void addUser();
void viewUsers();
void executeCommand(char *command);

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} User;

User users[10];
int userCount = 0;

int main() {
    char choice[MAX_INPUT_SIZE];
    char command[MAX_INPUT_SIZE];

    while (1) {
        printf("Welcome to the Simple Database!\n");
        printf("1. Add User\n");
        printf("2. View Users\n");
        printf("3. Execute Command\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        fgets(choice, MAX_INPUT_SIZE, stdin);

        if (choice[0] == '1') {
            addUser();
        } else if (choice[0] == '2') {
            viewUsers();
        } else if (choice[0] == '3') {
            printf("Enter command to execute: ");
            fgets(command, MAX_INPUT_SIZE, stdin);
            executeCommand(command);
        } else if (choice[0] == '4') {
            printf("Goodbye!\n");
            break;
        } else {
            printf("Invalid choice, please try again.\n");
        }
    }

    return 0;
}

// Function to add a user to the database
void addUser() {
    if (userCount >= 10) {
        printf("User limit reached. Cannot add more users.\n");
        return;
    }

    User newUser;
    char ageStr[MAX_AGE_LENGTH];

    printf("Enter name: ");
    fgets(newUser.name, MAX_NAME_LENGTH, stdin);
    newUser.name[strcspn(newUser.name, "\n")] = 0; // Remove newline character

    printf("Enter age: ");
    fgets(ageStr, MAX_AGE_LENGTH, stdin);
    newUser.age = atoi(ageStr);

    users[userCount++] = newUser;
    printf("User added successfully!\n");