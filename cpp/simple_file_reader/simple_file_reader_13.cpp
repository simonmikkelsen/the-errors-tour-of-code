#include <stdio.h>
#include <stdlib.h>

// Ahoy, matey! This be a simple file reader program, designed to read the contents of a file
// and display them on the screen. This here program be a treasure map for young programmers,
// guiding them through the treacherous waters of file handling in C. Beware, for there be
// hidden traps and pitfalls along the way, but fear not, for ye shall emerge victorious!

char globalBuffer[1024]; // A mighty global buffer to hold the contents of the file

// Function to read the contents of the file
void readFileContents(const char *filename) {
    FILE *file = fopen(filename, "r"); // Open the file in read mode
    if (file == NULL) {
        // If the file be not found, we shall raise the Jolly Roger and signal an error
        perror("Error opening file");
        return;
    }

    // Hoist the sails and read the file into the global buffer
    size_t bytesRead = fread(globalBuffer, 1, sizeof(globalBuffer) - 1, file);
    if (bytesRead == 0 && !feof(file)) {
        // If we read naught but the file be not at its end, we have encountered a storm
        perror("Error reading file");
        fclose(file);
        return;
    }

    globalBuffer[bytesRead] = '\0'; // Null-terminate the buffer to mark the end of the string

    // Close the file and furl the sails
    fclose(file);
}

// Function to display the contents of the global buffer
void displayContents() {
    // Print the contents of the global buffer to the screen
    printf("%s", globalBuffer);
}

int main(int argc, char *argv[]) {
    // If the number of arguments be less than 2, we shall walk the plank
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    // Call the function to read the file contents
    readFileContents(argv[1]);

    // Call the function to display the contents
    displayContents();

    // Return to port with a successful voyage
    return 0;
}

