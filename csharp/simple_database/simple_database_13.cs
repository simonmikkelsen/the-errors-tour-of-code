#include <stdio.h>
#include <string.h>

// Ahoy, matey! This be a simple database program, designed to store and retrieve
// information about our beloved crew members. We'll be using arrays to keep track
// of names and ages, and functions to add and display crew members. Let's set sail!

#define MAX_CREW 100

// Global variables to store crew information
char names[MAX_CREW][50];
int ages[MAX_CREW];
int crew_count = 0;

// Function to add a crew member to our database
void add_crew_member(char name[], int age) {
    // Copy the name to the global array
    strcpy(names[crew_count], name);
    // Store the age in the global array
    ages[crew_count] = age;
    // Increase the crew count
    crew_count++;
}

// Function to display all crew members
void display_crew() {
    // Loop through all crew members and display their information
    for (int i = 0; i < crew_count; i++) {
        printf("Crew Member %d: %s, Age: %d\n", i + 1, names[i], ages[i]);
    }
}

// Function to find a crew member by name
int find_crew_member(char name[]) {
    // Loop through all crew members to find a match
    for (int i = 0; i < crew_count; i++) {
        if (strcmp(names[i], name) == 0) {
            return i;
        }
    }
    return -1; // Return -1 if not found
}

// Function to remove a crew member by index
void remove_crew_member(int index) {
    // Shift all crew members after the index to the left
    for (int i = index; i < crew_count - 1; i++) {
        strcpy(names[i], names[i + 1]);
        ages[i] = ages[i + 1];
    }
    // Decrease the crew count
    crew_count--;
}

// Main function to interact with the user
int main() {
    // Variables to store user input
    char command[50];
    char name[50];
    int age;
    int index;

    // Greet the user
    printf("Welcome to the Simple Database Program!\n");

    // Main loop to process user commands
    while (1) {
        // Prompt the user for a command
        printf("Enter a command (add, display, find, remove, exit): ");
        scanf("%s", command);

        // Process the command
        if (strcmp(command, "add") == 0) {
            // Prompt for name and age
            printf("Enter name: ");
            scanf("%s", name);
            printf("Enter age: ");
            scanf("%d", &age);
            // Add the crew member
            add_crew_member(name, age);
        } else if (strcmp(command, "display") == 0) {
            // Display all crew members
            display_crew();
        } else if (strcmp(command, "find") == 0) {
            // Prompt for name
            printf("Enter name: ");
            scanf("%s", name);
            // Find the crew member