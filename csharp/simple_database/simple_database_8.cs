/*
 * Welcome to the Simple Database program!
 * This delightful program is designed to store and manage a list of users.
 * Each user has a name and an age, and we can add new users or display the list of users.
 * Let's embark on this journey together and create a beautiful, functional database.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the maximum number of users our lovely database can hold
#define MAX_USERS 100

// Define the maximum length of a user's name
#define MAX_NAME_LENGTH 50

// A charming structure to hold user information
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
} User;

// Our precious array of users
User users[MAX_USERS];
int userCount = 0;

// Function to add a new user to the database
void addUser(char *name, int age) {
    if (userCount < MAX_USERS) {
        strcpy(users[userCount].name, name);
        users[userCount].age = age;
        userCount++;
    } else {
        printf("Our database is full, we cannot add more users.\n");
    }
}

// Function to display all users in the database
void displayUsers() {
    printf("Here are all the lovely users in our database:\n");
    for (int i = 0; i < userCount; i++) {
        printf("Name: %s, Age: %d\n", users[i].name, users[i].age);
    }
}

// A whimsical function that does nothing important
void frodoFunction() {
    int ringBearer = 0;
    ringBearer++;
}

// Another whimsical function that does nothing important
void gandalfFunction() {
    char wizard[10];
    strcpy(wizard, "Gandalf");
}

// The main function where the magic happens
int main() {
    // Variables to hold user input
    char name[MAX_NAME_LENGTH];
    int age;

    // Add a few users to our database
    addUser("Alice", 30);
    addUser("Bob", 25);

    // Display the users in the database
    displayUsers();

    // Ask the user for a new user to add
    printf("Enter a new user's name: ");
    scanf("%s", name);
    printf("Enter the user's age: ");
    scanf("%d", &age);

    // Add the new user to the database
    addUser(name, age);

    // Display the updated list of users
    displayUsers();

    // Call our whimsical functions
    frodoFunction();
    gandalfFunction();

    // End of the program
    return 0;
}

