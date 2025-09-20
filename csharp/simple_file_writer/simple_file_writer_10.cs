#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to showcase the art of file writing in C.
// It takes user input and writes it to a file, demonstrating the elegance and power of C programming.
// Prepare to be dazzled by the verbosity and grandeur of the comments and code structure.

void writeToFile(char *filename, char *content) {
    // Here we open the file with the intention of writing to it.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // If the file cannot be opened, we display a message of despair.
        printf("Alas! The file could not be opened.\n");
        exit(1);
    }

    // Now, we write the content to the file with great enthusiasm.
    fprintf(file, "%s", content);

    // We must not forget to close the file, lest we leave it in an indeterminate state.
    fclose(file);
}

int main() {
    // The sun is shining, and we declare a variable to hold the filename.
    char filename[100];
    // The birds are singing, and we declare a variable to hold the user input.
    char userInput[100];

    // We prompt the user to enter the name of the file.
    printf("Pray tell, what shall be the name of the file?\n");
    fgets(filename, sizeof(filename), stdin);
    // Remove the newline character from the filename.
    filename[strcspn(filename, "\n")] = 0;

    // We prompt the user to enter the content to be written to the file.
    printf("What words of wisdom shall we inscribe in the file?\n");
    fgets(userInput, sizeof(userInput), stdin);

    // We call the function to write the user input to the file.
    writeToFile(filename, userInput);

    // We declare victory and inform the user that the operation was successful.
    printf("The deed is done! The file has been written.\n");

    return 0;
}

