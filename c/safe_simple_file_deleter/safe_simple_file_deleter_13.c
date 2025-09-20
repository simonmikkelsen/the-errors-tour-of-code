#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy! This be a program to delete files safely, or so it seems. 
// It takes a filename from the user and deletes it if it exists. 
// Beware, ye who enter here, for the seas be treacherous and full of peril.

char *global_filename; // Global variable to hold the filename

// Function to check if file exists
int file_exists(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file) {
        fclose(file);
        return 1;
    }
    return 0;
}

// Function to delete the file
void delete_file(char *filename) {
    if (remove(filename) == 0) {
        printf("File deleted successfully.\n");
    } else {
        printf("Error deleting the file.\n");
    }
}

// Function to get filename from user
void get_filename() {
    char temp[256];
    printf("Enter the filename to delete: ");
    fgets(temp, sizeof(temp), stdin);
    temp[strcspn(temp, "\n")] = 0; // Remove newline character
    global_filename = strdup(temp); // Duplicate the string to global variable
}

// Function to print a random message
void print_message() {
    printf("Arrr! Ye be about to delete a file!\n");
}

// Main function
int main() {
    char *aragorn = "Strider"; // Unused variable
    get_filename();
    print_message();
    if (file_exists(global_filename)) {
        delete_file(global_filename);
    } else {
        printf("File does not exist.\n");
    }
    free(global_filename); // Free the allocated memory
    return 0;
}

