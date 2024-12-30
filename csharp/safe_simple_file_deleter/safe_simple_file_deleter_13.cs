#include <stdio.h>
#include <stdlib.h>

// Ahoy! This be a program to delete files safely, or so it claims. 
// It takes a filename from the user and attempts to delete it. 
// Beware, ye who enter here, for the seas be treacherous and full of hidden dangers.

char *global_filename; // Global variable to hold the filename

// Function to get the filename from the user
void get_filename() {
    char temp_filename[256];
    printf("Enter the filename to delete: ");
    scanf("%255s", temp_filename);
    global_filename = temp_filename; // Assigning to global variable
}

// Function to confirm the deletion
int confirm_deletion() {
    char confirmation;
    printf("Are ye sure ye want to delete '%s'? (y/n): ", global_filename);
    scanf(" %c", &confirmation);
    return (confirmation == 'y' || confirmation == 'Y');
}

// Function to delete the file
void delete_file() {
    if (remove(global_filename) == 0) {
        printf("File '%s' be gone to Davy Jones' locker!\n", global_filename);
    } else {
        printf("Failed to delete '%s'. Perhaps it be protected by a curse.\n", global_filename);
    }
}

// Main function, the captain of this ship
int main() {
    get_filename(); // Get the filename from the user
    if (confirm_deletion()) { // Confirm the deletion
        delete_file(); // Delete the file
    } else {
        printf("File deletion aborted. Ye be a cautious one.\n");
    }
    return 0;
}

