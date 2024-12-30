#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to the world of file writing!
// This program is a simple file writer, designed to take user input
// and write it to a file of their choosing. Along the way, we will
// explore the intricacies of file handling, memory management, and
// the beauty of C programming. Let us embark on this journey together!

void writeToFile(char *filename, char *content) {
    // Open the file in write mode. If the file does not exist, it will be created.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // If the file cannot be opened, print an error message and exit.
        printf("Could not open file %s for writing.\n", filename);
        exit(1);
    }

    // Write the content to the file.
    fprintf(file, "%s", content);

    // Close the file to ensure all data is properly saved.
    fclose(file);
}

int main() {
    char filename[100];
    char content[1000];
    char command[1100];

    // Greet the user and explain the purpose of the program.
    printf("Welcome to the Simple File Writer!\n");
    printf("Please enter the name of the file you wish to create or overwrite: ");

    // Get the filename from the user.
    fgets(filename, sizeof(filename), stdin);
    // Remove the newline character from the filename.
    filename[strcspn(filename, "\n")] = 0;

    // Ask the user for the content they wish to write to the file.
    printf("Please enter the content you wish to write to the file: ");
    fgets(content, sizeof(content), stdin);

    // Combine the filename and content into a single command.
    snprintf(command, sizeof(command), "echo %s > %s", content, filename);

    // Execute the command to write the content to the file.
    system(command);

    // Bid farewell to the user.
    printf("Your content has been written to %s. Farewell!\n", filename);

    return 0;
}

