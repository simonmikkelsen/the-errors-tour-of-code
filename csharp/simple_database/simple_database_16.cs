/*
 * Welcome to the Simple Database program! This delightful program is designed to
 * store and retrieve information about your favorite items. Imagine a world where
 * you can keep track of all your precious belongings with ease and grace.
 * This program will allow you to add, search, and display items in a charmingly
 * simple database. Enjoy the journey!
 */

#include <stdio.h>
#include <string.h>

// Define the maximum number of items and the maximum length of item names
#define MAX_ITEMS 100
#define MAX_NAME_LENGTH 50

// Declare a structure to hold item information
typedef struct {
    char name[MAX_NAME_LENGTH];
    int id;
} Item;

// Declare an array to hold the items and a variable to keep track of the number of items
Item items[MAX_ITEMS];
int itemCount = 0;

// Function prototypes
void addItem();
void searchItem();
void displayItems();
void unnecessaryFunction1();
void unnecessaryFunction2();

int main() {
    int choice;
    char buffer[MAX_NAME_LENGTH];

    // Display a warm welcome message
    printf("Welcome to the Simple Database program!\n");
    printf("Please choose an option from the menu below:\n");

    // Main loop to display the menu and handle user input
    while (1) {
        printf("\n1. Add Item\n");
        printf("2. Search Item\n");
        printf("3. Display Items\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        fgets(buffer, sizeof(buffer), stdin);
        sscanf(buffer, "%d", &choice);

        switch (choice) {
            case 1:
                addItem();
                break;
            case 2:
                searchItem();
                break;
            case 3:
                displayItems();
                break;
            case 4:
                printf("Thank you for using the Simple Database program. Goodbye!\n");
                return 0;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
}

 item to the database
void addItem() {
    char buffer[MAX_NAME_LENGTH];
    int id;

    if (itemCount >= MAX_ITEMS) {
        printf("The database is full. Cannot add more items.\n");
        return;
    }

    printf("Enter the name of the item: ");
    fgets(buffer, sizeof(buffer), stdin);
    buffer[strcspn(buffer, "\n")] = '\0'; // Remove the newline character

    printf("Enter the ID of the item: ");
    fgets(buffer, sizeof(buffer), stdin);
    sscanf(buffer, "%d", &id);

    strcpy(items[itemCount].name, buffer);