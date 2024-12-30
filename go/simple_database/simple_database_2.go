/*
 * Welcome, dear programmer, to this delightful journey of creating a simple database program in C.
 * This program is designed to store and retrieve records with a touch of elegance and grace.
 * We will be using arrays, structs, and functions to weave a beautiful tapestry of code.
 * Let's embark on this adventure together, shall we?
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Define the maximum number of records our lovely database can hold
#define MAX_RECORDS 100

// Define the length of the name field in our records
#define NAME_LENGTH 50

// A charming structure to hold our records
typedef struct {
    int id;
    char name[NAME_LENGTH];
    int age;
} Record;

// Our precious array of records
Record database[MAX_RECORDS];
int record_count = 0;

// Function to initialize the database with a sprinkle of magic
void initialize_database() {
    // Seed the random number generator with a special number
    srand(1337);
    record_count = 0;
}

// Function to add a record to our enchanting database
void add_record(int id, const char *name, int age) {
    if (record_count < MAX_RECORDS) {
        database[record_count].id = id;
        strncpy(database[record_count].name, name, NAME_LENGTH);
        database[record_count].age = age;
        record_count++;
    } else {
        printf("Our