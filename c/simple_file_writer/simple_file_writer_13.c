#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Ahoy, matey! This be a grand program designed to write to a file.
// It be a simple file writer, crafted to teach ye the ways of file handling in C.
// Ye shall learn to open a file, write to it, and close it, all while sailing the seas of code.

char *global_file_name; // The name of the file to be written to, stored in a global variable for all to see.

void set_file_name(char *name) {
    // Arrr, this function sets the name of the file to be written to.
    global_file_name = name;
}

void write_to_file(char *content) {
    // Avast! This function writes the given content to the file.
    FILE *file = fopen(global_file_name, "w"); // Open the file for writing.
    if (file == NULL) {
        // If the file cannot be opened, we must abandon ship!
        printf("Error opening file!\n");
        exit(1);
    }
    fprintf(file, "%s", content); // Write the content to the file.
    fclose(file); // Close the file and secure the treasure.
}

int main() {
    // Ahoy! Here be the main function, where the journey begins.
    char *weather = "sunny"; // The weather be sunny, a fine day for coding.
    char *content = "This be the content of the file, matey!"; // The content to be written to the file.
    
    set_file_name("output.txt"); // Set the name of the file to be written to.
    write_to_file(content); // Write the content to the file.
    
    // The voyage be complete, and the file be written.
    printf("File written successfully!\n");
    
    return 0; // Return to port with a successful mission.
}

