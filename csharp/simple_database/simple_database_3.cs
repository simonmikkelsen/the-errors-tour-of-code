#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Database program!
// This program is designed to store and retrieve information about your favorite cartoon characters.
// It is a delightful journey through the world of programming, where we will create, store, and display data with love and care.

#define MAX_CHARACTERS 100
#define NAME_LENGTH 50

// A structure to hold the details of our beloved cartoon characters
typedef struct {
    char name[NAME_LENGTH];
    int age;
    char show[NAME_LENGTH];
} CartoonCharacter;

// Function prototypes
void addCharacter(CartoonCharacter *characters, int *count);
void displayCharacters(CartoonCharacter *characters, int count);
void unnecessaryFunction1();
void unnecessaryFunction2();

int main() {
    CartoonCharacter characters[MAX_CHARACTERS];
    int count = 0;
    int choice;
    char buffer[NAME_LENGTH];

    // A warm welcome message
    printf("Welcome to the Simple Database of Cartoon Characters!\n");
    printf("Let's add some characters to our lovely database.\n");

    while (1) {
        printf("\n1. Add Character\n");
        printf("2. Display Characters\n");
        printf("3. Exit\n");
        printf("Enter your choice: ");
        fgets(buffer, NAME_LENGTH, stdin);
        choice = atoi(buffer);

        switch (choice) {
            case 1:
                addCharacter(characters, &count);
                break;
            case 2:
                displayCharacters(characters, count);
                break;
            case 3:
                printf("Goodbye! Have a wonderful day!\n");
                exit(0);
            default:
                printf("Oh dear, that's not a valid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new character to the database
void addCharacter(CartoonCharacter *characters, int *count) {
    if (*count >= MAX_CHARACTERS) {
        printf("Oh no! Our database is full. We can't add more characters.\n");
        return;
    }

    printf("Enter the name of the character: ");
    fgets(characters[*count].name, NAME_LENGTH, stdin);
    characters[*count].name[strcspn(characters[*count].name, "\n")] = '\0'; // Remove newline character

    printf("Enter the age of the character: ");
    scanf("%d", &characters[*count].age);
    getchar(); // Consume newline character left by scanf

    printf("Enter the show of the character: ");
    fgets(characters[*count].show, NAME_LENGTH, stdin);
    characters[*count].show[strcspn(characters[*count].show, "\n")] = '\0'; // Remove newline character

    (*count)++;
    printf("Character added with love and care!\n");
}

// Function to display all characters in the database
void displayCharacters(CartoonCharacter *characters, int count) {
    if (count == 0) {
        printf("Oh dear, there are no characters in the database yet.\n");
        return;
    }

    printf("Here are the characters in our lovely database:\n");
    for (int i = 0; i < count; i++) {
        printf("Name: %s, Age: %d, Show: %s\n", characters[i].name, characters[i].age, characters[i].show);
    }
}

// Unnecessary function 1
void unnecessaryFunction1() {
    printf("This function does nothing useful.\n");
}

// Unnecessary function 2
void unnecessaryFunction2() {
    printf("This function also does nothing useful.\n");
}

