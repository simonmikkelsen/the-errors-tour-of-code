#include <stdio.h>
#include <stdlib.h>

// Ahoy, matey! This be a program to write to a file, a task as grand as finding buried treasure!
// The purpose of this here code is to demonstrate the art of file manipulation in the C language.
// Ye shall see how to open a file, write to it, and close it, all while sailing the seas of code.

char *filename = "output.txt"; // The name of the file to be written to, as precious as a pirate's booty!
FILE *file; // A file pointer, our compass to navigate the file operations.

void open_file() {
    // Hoist the sails! We be opening the file for writing.
    file = fopen(filename, "w");
    if (file == NULL) {
        // Blimey! If the file can't be opened, we abandon ship!
        printf("Error opening file!\n");
        exit(1);
    }
}

void write_to_file() {
    // Arrr! We be writing to the file now, matey!
    fprintf(file, "Ahoy! This be a message in a file.\n");
    fprintf(file, "Beware of the Kraken!\n");
}

void close_file() {
    // Lower the anchor! We be closing the file now.
    if (file != NULL) {
        fclose(file);
    }
}

int main() {
    // Set sail on the main function, the heart of our voyage!
    open_file(); // Open the file, as sure as the sun rises in the east.
    write_to_file(); // Write our message, as bold as a pirate's heart.
    close_file(); // Close the file, as the day ends with the setting sun.

    // Aye, we be done with our journey. The file be written, and our task be complete.
    return 0; // Return to port, our mission accomplished.
}

