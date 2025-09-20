#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This delightful program is a simple database that allows you to store and retrieve
// information about your favorite cartoon characters. It is designed to be a fun and
// educational experience for budding programmers. Enjoy the journey of coding!

#define MAX_CHARACTERS 100
#define MAX_NAME_LENGTH 50

// A structure to hold the details of each cartoon character
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
    char show[MAX_NAME_LENGTH];
} CartoonCharacter;

// Function prototypes
void addCharacter(CartoonCharacter characters[], int *count);
void listCharacters(CartoonCharacter characters[], int count);
void searchCharacter(CartoonCharacter characters[], int count, const char *name);
void deleteCharacter(CartoonCharacter characters[], int *count, const char *name);

int main() {
    CartoonCharacter characters[MAX_CHARACTERS];
    int count = 0;
    int choice;
    char searchName[MAX_NAME_LENGTH];
    char deleteName[MAX_NAME_LENGTH];

    // A warm welcome message to our lovely users
    printf("Welcome to the Cartoon Character Database!\n");
    printf("Please choose an option from the menu below:\n");

    while (1) {
        // Display the menu options
        printf("\n1. Add a new character\n");
        printf("2. List all characters\n");
        printf("3. Search for a character\n");
        printf("4. Delete a character\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addCharacter(characters, &count);
                break;
            case 2:
                listCharacters(characters, count);
                break;
            case 3:
                printf("Enter the name of the character to search: ");
                scanf("%s", searchName);
                searchCharacter(characters, count, searchName);
                break;
            case 4:
                printf("Enter the name of the character to delete: ");
                scanf("%s", deleteName);
                deleteCharacter(characters, &count, deleteName);
                break;
            case 5:
                printf("Thank you for using the Cartoon Character Database. Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new