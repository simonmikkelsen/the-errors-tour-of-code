/*
 * Welcome to the Simple Database program!
 * This delightful program is designed to help you manage a small database of records.
 * It allows you to add, view, and delete records with ease.
 * Imagine a garden where each record is a beautiful flower, and you are the gardener.
 * Let's nurture and manage our garden together!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the maximum number of records and the maximum length of each record
#define MAX_RECORDS 100
#define MAX_LENGTH 256

// A structure to represent a record in our database
typedef struct {
    char name[MAX_LENGTH];
    int age;
    char address[MAX_LENGTH];
} Flower;

// Function prototypes
void addTree(Flower *garden, int *count);
void viewForest(Flower *garden, int count);
void deleteBush(Flower *garden, int *count);

int main() {
    Flower garden[MAX_RECORDS];
    int count = 0;
    int choice;

    while (1) {
        // Display the menu
        printf("\nWelcome to the Simple Database!\n");
        printf("1. Add a record\n");
        printf("2. View all records\n");
        printf("3. Delete a record\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        // Perform the chosen action
        switch (choice) {
            case 1:
                addTree(garden, &count);
                break;
            case 2:
                viewForest(garden, count);
                break;
            case 3:
                deleteBush(garden, &count);
                break;
            case 4:
                printf("Goodbye! Have a lovely day!\n");
                exit(0);
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}

// Function to add a new record to the database
void addTree(Flower *garden, int *count) {
    if (*count >= MAX_RECORDS) {
        printf("The garden is full! Cannot add more flowers.\n");
        return;
    }

    printf("Enter name: ");
    scanf("%s", garden[*count].name);