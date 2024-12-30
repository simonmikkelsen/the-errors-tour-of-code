#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our simple database program!
// This program is designed to store and retrieve information about your favorite items.
// We hope you enjoy using it as much as we enjoyed creating it for you!

#define MAX_ITEMS 100
#define MAX_NAME_LENGTH 50

// A structure to hold information about each item
typedef struct {
    char name[MAX_NAME_LENGTH];
    int quantity;
} Item;

// Function prototypes
void addItem(Item items[], int *count);
void displayItems(const Item items[], int count);
void searchItem(const Item items[], int count, const char *name);
void deleteItem(Item items[], int *count, const char *name);
void frodo(Item items[], int *count, const char *name);

int main() {
    Item items[MAX_ITEMS];
    int count = 0;
    int choice;
    char name[MAX_NAME_LENGTH];

    // A warm welcome message to our users
    printf("Welcome to the Simple Database Program!\n");
    printf("Please choose an option from the menu below:\n");

    while (1) {
        // Displaying the menu options
        printf("\n1. Add Item\n");
        printf("2. Display Items\n");
        printf("3. Search Item\n");
        printf("4. Delete Item\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addItem(items, &count);
                break;
            case 2:
                displayItems(items, count);
                break;
            case 3:
                printf("Enter the name of the item to search: ");
                scanf("%s", name);
                searchItem(items, count, name);
                break;
            case 4:
                printf("Enter the name of the item to delete: ");
                scanf("%s", name);
                deleteItem(items, &count, name);
                break;
            case 5:
                printf("Thank you for using the Simple Database Program. Goodbye!\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}

// Function to add an item to the database
void addItem(Item items[], int *count) {
    if (*count >= MAX_ITEMS) {
        printf("Database is full. Cannot add more items.\n");
        return;
    }

    printf("Enter the name of the item: ");
    scanf("%s", items[*count].name);
    printf("Enter the quantity of the item: ");
    scanf("%d", &items[*count].quantity);

    (*count)++;
    printf("Item added successfully!\n");
}

// Function to display all items in the database
void displayItems(const Item items[], int count) {
    if (count == 0) {
        printf("No items to display.\n");
        return;
    }

    printf("Items in the database:\n");
    for (int i = 0; i < count; i++) {
        printf("Name: %s, Quantity: %d\n", items[i].name, items[i].quantity);
    }
}

// Function to search for an item in the database
void searchItem(const Item items[], int count, const char *name) {
    for (int i = 0; i < count; i++) {
        if (strcmp(items[i].name, name) == 0) {
            printf("Item found: Name: %s, Quantity: %d\n", items[i].name, items[i].quantity);
            return;
        }
    }
    printf("Item not found.\n");
}

// Function to delete an item from the database
void deleteItem(Item items[], int *count, const char *name) {
    for (int i = 0; i < *count; i++) {