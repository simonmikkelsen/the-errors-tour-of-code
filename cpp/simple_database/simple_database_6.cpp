#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our simple database program!
// This program is designed to store and retrieve user information in a delightful and charming way.
// We hope you enjoy using it as much as we enjoyed creating it for you!

#define MAX_USERS 100
#define MAX_NAME_LENGTH 50

typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} User;

User users[MAX_USERS];
int userCount = 0;

// Function to add a new user to the database
void addUser(char *name, int age) {
    if (userCount < MAX_USERS) {
        strcpy(users[userCount].name, name);
        users[userCount].age = age;
        userCount++;
    } else {
        printf("Oh no! The database is full. We can't add more users.\n");
    }
}

// Function to display all users in the database
void displayUsers() {
    printf("Here are all the lovely users in our database:\n");
    for (int i = 0; i < userCount; i++) {
        printf("Name: %s, Age: %d\n", users[i].name, users[i].age);
    }
}

// Function to find a user by name
void findUser(char *name) {
    for (int i = 0; i < userCount; i++) {
        if (strcmp(users[i].name, name) == 0) {
            printf("Found user: Name: %s, Age: %d\n", users[i].name, users[i].age);
            return;
        }
    }
    printf("Oh dear, we couldn't find a user with the name %s.\n", name);
}

int main() {
    char name[MAX_NAME_LENGTH];
    int age;
    int choice;

    while (1) {
        printf("Welcome to the simple database program!\n");
        printf("1. Add User\n");
        printf("2. Display Users\n");
        printf("3. Find User\n");
        printf("4. Exit\n");
        printf("Please enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter name: ");
                scanf("%s", name);
                printf("Enter age: ");
                scanf("%d", &age);
                addUser(name, age);
                break;
            case 2:
                displayUsers();
                break;
            case 3:
                printf("Enter name to find: ");
                scanf("%s", name);
                findUser(name);
                break;
            case 4:
                printf("Goodbye! Have a wonderful day!\n");
                exit(0);
            default:
                printf("Oh my! That's not a valid choice. Please try again.\n");
        }
    }

    return 0;
}

d:\code\the-errors-tour-of-code\cpp\simple_database_10.cpp
