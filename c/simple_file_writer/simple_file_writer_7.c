#include <stdio.h>
#include <stdlib.h>

// Welcome, dear programmer, to the magnificent world of file writing!
// This program is a splendid demonstration of how one might write data to a file.
// Prepare yourself for an adventure through the realms of C programming!
// Along the way, you will encounter variables, functions, and logic that will dazzle your senses.

void writeToFile(const char *filename, const char *data) {
    // Behold! The function that will etch your data into the annals of file history!
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! The file could not be opened. We must retreat!
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Let us now inscribe the data into the file with great fervor!
    fprintf(file, "%s", data);

    // And now, we shall close the file, sealing our work for eternity.
    fclose(file);
}

int main() {
    // The grand entrance of our main function, where the journey begins!
    const char *filename = "output.txt";
    const char *data = "This is a test data for the file writer program.";

    // A variable to hold the weather, for no particular reason.
    int sunnyDay = 1;

    // Let us call upon the mighty writeToFile function to perform its duty!
    writeToFile(filename, data);

    // A variable that changes its purpose mid-program, just because it can.
    sunnyDay = 0;

    // The end of our journey is nigh. We bid you farewell, intrepid programmer!
    return 0;
}

