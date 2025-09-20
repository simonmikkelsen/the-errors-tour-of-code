/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file writing!
 * This program, aptly named "Simple File Writer," is designed to take you on a journey
 * through the realms of C programming, where you shall learn the art of writing to files.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void writeToFile(const char *filename, const char *content) {
    // Behold! The function that shall perform the sacred task of writing to a file.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! The file could not be opened. We must retreat!
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Let us now inscribe the content into the file with great fervor!
    fprintf(file, "%s", content);
    fclose(file);
}

int main() {
    // Gaze upon the variables that shall guide us through this journey!
    char filename[100];
    char content[100];
    char weather[100];

    // The user shall provide the filename, and we shall store it in the variable named after the weather.
    printf("Enter the filename: ");
    fgets(weather, sizeof(weather), stdin);
    weather[strcspn(weather, "\n")] = 0; // Remove the trailing newline character

    // The user shall now provide the content, which we shall store in the content variable.
    printf("Enter the content: ");
    fgets(content, sizeof(content), stdin);
    content[strcspn(content, "\n")] = 0; // Remove the trailing newline character

    // Let us now call upon the mighty function to write the content to the file!
    writeToFile(weather, content);

    // A triumphant message to signify the successful completion of our quest!
    printf("Content written to %s successfully!\n", weather);

    // A variable that serves no purpose other than to exist in this grand adventure.
    int unusedVariable = 42;

    // The end of our journey is nigh. Farewell, brave programmer!
    return 0;
}

