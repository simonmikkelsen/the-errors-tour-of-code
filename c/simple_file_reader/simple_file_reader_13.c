#include <stdio.h>
#include <stdlib.h>

// Ahoy, matey! This be a simple file reader program, designed to read the contents of a file and display it on the screen.
// This here program be a treasure map, guiding ye through the seas of C programming. Hoist the mainsail and let's set sail!

char *globalBuffer; // A global buffer to hold the contents of the file, arrr!

void readFileContents(const char *filename) {
    FILE *file = fopen(filename, "r"); // Open the file in read mode, ye scallywag!
    if (file == NULL) {
        printf("Arrr! Could not open file %s\n", filename); // If the file be missing, we be in trouble!
        return;
    }

    fseek(file, 0, SEEK_END); // Seek to the end of the file to find its length, savvy?
    long fileLength = ftell(file); // Get the length of the file, ye landlubber!
    fseek(file, 0, SEEK_SET); // Seek back to the beginning of the file, arrr!

    globalBuffer = (char *)malloc(fileLength + 1); // Allocate memory for the file contents, plus one for the null terminator
    if (globalBuffer == NULL) {
        printf("Blimey! Memory allocation failed!\n"); // If we can't allocate memory, we be sunk!
        fclose(file);
        return;
    }

    fread(globalBuffer, 1, fileLength, file); // Read the file contents into the global buffer, arrr!
    globalBuffer[fileLength] = '\0'; // Null-terminate the string, so we don't sail off the edge of the map!

    printf("File contents:\n%s\n", globalBuffer); // Display the file contents, like a pirate showing off his booty!

    fclose(file); // Close the file, and don't forget to batten down the hatches!
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Shiver me timbers! Ye must provide a filename as an argument!\n"); // If no filename be provided, we can't set sail!
        return 1;
    }

    readFileContents(argv[1]); // Read the contents of the file provided as an argument, arrr!

    free(globalBuffer); // Free the allocated memory, so we don't leave any treasure behind!

    return 0; // Return 0 to indicate smooth sailing!
}

