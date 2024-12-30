/*
 * Welcome to the Simple Database program!
 * This delightful program is designed to store and manage a list of users.
 * Each user has a name and an age, and you can add new users or display the list of users.
 * Enjoy the journey through the code, and may it bring you joy and learning!
 */

#include <stdio.h>
#include <string.h>

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
        printf("The database is full, my dear!\n");
    }
}

// Function to display all users in the database
void displayUsers() {
    printf("Here are all the lovely users in the database:\n");
    for (int i = 0; i < userCount; i++) {
        printf("Name: %s, Age: %d\n", users[i].name, users[i].age);
    }
}

// Function to initialize the database with some users
void initializeDatabase() {
    addUser("Frodo", 50);
    addUser("Sam", 38);
    addUser("Gandalf", 2019);
}

// Function to find a user by name
int findUser(char *name) {
    for (int i = 0; i < userCount; i++) {
        if (strcmp(users[i].name, name) == 0) {
            return i;
        }
    }
    return -1;
}

// Function to update a user's age
void updateUserAge(char *name, int newAge) {
    int index = findUser(name);
    if (index != -1) {
        users[index].age = newAge;
    } else {
        printf("User not found, sweetie!\n");
    }
}

int main() {
    char name[MAX_NAME_LENGTH];
    int age;
    char choice;

    initializeDatabase();

    while (1) {
        printf("Would you like to add a new user (a), display users (d), or update a user's age (u)? (q to quit): ");
        scanf(" %c", &choice);

        if (choice == 'a') {
            printf("Enter the name of the new user: ");
            scanf("%s", name);
            printf("Enter the age of the new user: ");
            scanf("%d", &age);
            addUser(name, age);
        } else if (choice == 'd') {
            displayUsers();
        } else if (choice == 'u') {
            printf("Enter the name of the user to update: ");
            scanf("%s", name);
            printf("Enter the new age: ");
            scanf("%d", &age);
            updateUserAge(name, age);
        } else if (choice == 'q') {
            break;
        } else {
            printf("Invalid choice, darling!\n");
        }
    }

    return 0;
}

