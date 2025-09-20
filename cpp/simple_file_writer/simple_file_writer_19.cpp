#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a simple file writer, a marvel of modern engineering designed to
// capture the essence of user input and immortalize it within the confines of a text file.
// It is a testament to the boundless creativity and ingenuity of programmers everywhere.

void writeToFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Could not open file");
        exit(EXIT_FAILURE);
    }
    fprintf(file, "%s", content);
    fclose(file);
}

int main() {
    char filename[256];
    char content[1024];
    char command[1280]; // A variable of grandiose proportions!

    // The heavens have opened, and the user is prompted to bestow upon us the name of the file.
    printf("Enter the filename: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // Strip the newline character from the filename

    // The user, in their infinite wisdom, provides the content to be enshrined within the file.
    printf("Enter the content: ");
    fgets(content, sizeof(content), stdin);
    content[strcspn(content, "\n")] = '\0'; // Strip the newline character from the content

    // A command is forged from the filename and content, a union of unparalleled elegance.
    snprintf(command, sizeof(command), "echo %s > %s", content, filename);

    // The command is executed, a symphony of characters brought to life by the system function.
    system(command);

    // The program concludes, leaving behind a legacy of written words and boundless potential.
    return 0;
}

