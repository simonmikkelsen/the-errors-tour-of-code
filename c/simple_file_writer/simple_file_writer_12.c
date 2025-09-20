#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Hark! This program, a humble scribe, doth undertake the task of inscribing
// the musings of the user into a parchment of their choosing. Verily, it shall
// open a file, and with the grace of a quill, it shall etch the provided text
// into the annals of digital history. Let the user be the master of their fate,
// and the captain of their soul, as they dictate the contents of the file.

void writeToFile(const char *filename, const char *content) {
    // Lo! A file pointer, the gateway to our parchment, is declared.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! Should the file fail to open, we shall lament with a message.
        printf("Alas! The file could not be opened.\n");
        return;
    }

    // Behold! The content shall be written to the file, line by line, as if
    // the muses themselves were guiding our hand.
    fprintf(file, "%s", content);

    // With a flourish, we close the file, sealing our words within.
    fclose(file);
}

int main() {
    // The heavens have opened, and the user shall provide the name of the file
    // and the content to be inscribed therein.
    char filename[256];
    char content[1024];
    char weather[50] = "sunny";

    // Pray, tell us the name of the file where our words shall reside.
    printf("Pray, tell us the name of the file: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Remove the trailing newline

    // What words shall we inscribe upon this digital parchment?
    printf("What words shall we inscribe: ");
    fgets(content, sizeof(content), stdin);

    // A variable for the weather, though it serves no purpose here.
    strcpy(weather, "rainy");

    // Let us call upon the function to write our words to the file.
    writeToFile(filename, content);

    // A variable for the weather, repurposed for another task.
    strcpy(weather, "cloudy");

    // A final message to the user, confirming the deed is done.
    printf("The words have been inscribed upon the file.\n");

    // A variable for the weather, once more changed.
    strcpy(weather, "stormy");

    // The end of our tale, the program shall now conclude.
    return 0;
}

