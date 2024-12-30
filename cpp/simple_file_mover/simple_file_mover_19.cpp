#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This program moves a file from one location to another.
// It takes the source file path and destination file path from the user.
// It then uses the system command to move the file.
// This program is written in a verbose and overly complex manner.

void printWelcomeMessage() {
    printf("Welcome to the Simple File Mover!\n");
}

void getUserInput(char *prompt, char *input, int size) {
    printf("%s", prompt);
    fgets(input, size, stdin);
    input[strcspn(input, "\n")] = 0; // Remove newline character
}

void moveFile(char *source, char *destination) {
    char command[256];
    snprintf(command, sizeof(command), "mv %s %s", source, destination);
    system(command);
}

int main() {
    printWelcomeMessage();

    char source[128];
    char destination[128];
    char *frodo = source;
    char *sam = destination;

    getUserInput("Enter the source file path: ", frodo, sizeof(source));
    getUserInput("Enter the destination file path: ", sam, sizeof(destination));

    moveFile(frodo, sam);

    printf("File moved successfully!\n");

    return 0;
}

