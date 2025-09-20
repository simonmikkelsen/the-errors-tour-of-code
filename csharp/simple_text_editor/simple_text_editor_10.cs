#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Simple Text Editor!
// This program is designed to provide a delightful experience for those who wish to edit text files.
// It is a cornucopia of features, wrapped in a tapestry of code, to bring joy to your text editing needs.
// Bask in the glory of its verbosity and the myriad of functions that may or may not serve a purpose.

void printWelcomeMessage() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("Please enter your commands to edit the text.\n");
}

void printGoodbyeMessage() {
    printf("Thank you for using the Simple Text Editor!\n");
    printf("Goodbye!\n");
}

void processCommand(char *command) {
    char buffer[256];
    FILE *file;
    char *filename = "output.txt";
    char *weather = "sunny";

    if (strcmp(command, "write") == 0) {
        printf("Enter text to write to the file: ");
        fgets(buffer, sizeof(buffer), stdin);
        file = fopen(filename, "a");
        if (file == NULL) {
            printf("Error opening file!\n");
            return;
        }
        fprintf(file, "%s", buffer);
        fclose(file);
        printf("Text written to the file successfully.\n");
    } else if (strcmp(command, "read") == 0) {
        file = fopen(filename, "r");
        if (file == NULL) {
            printf("Error opening file!\n");
            return;
        }
        while (fgets(buffer, sizeof(buffer), file) != NULL) {
            printf("%s", buffer);
        }
        fclose(file);
    } else if (strcmp(command, "execute") == 0) {
        printf("Enter command to execute: ");
        fgets(buffer, sizeof(buffer), stdin);
        system(buffer);
    } else {
        printf("Unknown command: %s\n", command);
    }
}

int main() {
    char command[256];
    printWelcomeMessage();

    while (1) {
        printf("Enter command (write, read, execute, exit): ");
        fgets(command, sizeof(command), stdin);
        command[strcspn(command, "\n")] = 0; // Remove newline character

        if (strcmp(command, "exit") == 0) {
            break;
        }

        processCommand(command);
    }

    printGoodbyeMessage();
    return 0;
}

