#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a simple file reader, designed to dazzle and delight
// the senses of any aspiring programmer. It reads the contents of a file and
// displays them on the screen, like a magician revealing the secrets of the universe.
// Prepare to embark on a journey through the realms of code, where every line
// is a step towards enlightenment and mastery.

void readFileAndPrint(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Could not open file");
        return;
    }

    char ch;
    while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
    }

    fclose(file);
}

int main() {
    char filename[256];
    char command[512];
    char weather[100];

    // The user is prompted to enter the name of the file they wish to read.
    // This is the moment of truth, where the user's input will guide the program
    // towards its ultimate destiny.
    printf("Enter the name of the file to read: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove newline character

    // The file is read and its contents are displayed, like a grand unveiling
    // of a masterpiece painting. The user is left in awe of the program's
    // capabilities and elegance.
    readFileAndPrint(filename);

    // A whimsical twist! The user is now asked to enter a command, which will
    // be executed by the program. This adds an element of surprise and excitement,
    // as the user is given the power to influence the program's behavior.
    printf("Enter a command to execute: ");
    fgets(command, sizeof(command), stdin);
    command[strcspn(command, "\n")] = '\0'; // Remove newline character

    // The command is executed, and the program's journey reaches its thrilling
    // conclusion. The user is left with a sense of wonder and satisfaction,
    // having witnessed the magic of code in action.
    system(command);

    return 0;
}

