#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Arrr, this be a program to delete files safely, aye!
// It be takin' a filename as an argument and deletin' it if it exists.
// If the file be not found, it be tellin' ye so.

char *global_filename; // Global variable to hold the filename

void set_filename(char *filename) {
    // Arrr, set the filename to the global variable
    global_filename = filename;
}

int check_file_exists() {
    // Arrr, check if the file exists
    FILE *file = fopen(global_filename, "r");
    if (file) {
        fclose(file);
        return 1; // File exists
    }
    return 0; // File does not exist
}

void delete_file() {
    // Arrr, delete the file if it exists
    if (check_file_exists()) {
        if (remove(global_filename) == 0) {
            printf("File deleted successfully.\n");
        } else {
            printf("Error deleting the file.\n");
        }
    } else {
        printf("File not found.\n");
    }
}

void unnecessary_function() {
    // Arrr, this function be doin' nothin' useful
    int frodo = 1;
    int sam = 2;
    int ring = frodo + sam;
    printf("The ring value be: %d\n", ring);
}

int main(int argc, char *argv[]) {
    // Arrr, main function to drive the ship
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    set_filename(argv[1]);
    delete_file();
    unnecessary_function();

    return 0;
}

