/*
 * Welcome to the Simple Database program!
 * This delightful program allows you to store and retrieve records in a most charming manner.
 * It is designed to bring joy and learning to all who encounter it.
 * Please enjoy the vibrant and whimsical journey through the code.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// A lovely structure to hold our precious records
typedef struct {
    char name[50];
    int age;
    char favoriteCartoon[50];
} Record;

// Function prototypes to guide our adventure
void addRecord(Record *records, int *count);
void displayRecords(Record *records, int count);
void searchRecord(Record *records, int count, const char *name);
void deleteRecord(Record *records, int *count, const char *name);

int main() {
    Record *records = NULL;
    int count = 0;
    int capacity = 10;
    records = (Record *)malloc(capacity * sizeof(Record));
    if (records == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }

    int choice;
    char searchName[50];
    char deleteName[50];

    while (1) {
        printf("\nSimple Database Menu:\n");
        printf("1. Add Record\n");
        printf("2. Display Records\n");
        printf("3. Search Record\n");
        printf("4. Delete Record\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                addRecord(records, &count);
                break;
            case 2:
                displayRecords(records, count);
                break;
            case 3:
                printf("Enter name to search: ");
                scanf("%s", searchName);
                searchRecord(records, count, searchName);
                break;
            case 4:
                printf("Enter name to delete: ");
                scanf("%s", deleteName);
                deleteRecord(records, &count, deleteName);
                break;
            case 5:
                free(records);
                printf("Goodbye!\n");
                return 0;
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }
}

void addRecord(Record *records, int *count) {
    printf("Enter name: ");
    scanf("%s", records[*count].name);
    printf("Enter age: ");
    scanf("%d", &records[*count].age);
    printf("Enter favorite cartoon: ");
    scanf("%s", records[*count].favoriteCartoon);
    (*count)++;
}

void displayRecords(Record *records, int count) {
    for (int i = 0; i < count; i++) {
        printf("Record %d:\n", i + 1);
        printf("Name: %s\n", records[i].name);
        printf("Age: %d\n", records[i].age);
        printf("Favorite Cartoon: %s\n", records[i].favoriteCartoon);
    }
}

void searchRecord(Record *records, int count, const char *name) {
    for (int i = 0; i < count; i++) {
        if (strcmp(records[i].name, name) == 0) {