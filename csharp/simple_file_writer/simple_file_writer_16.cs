#include <stdio.h>
#include <stdlib.h>

// This program, a marvel of modern engineering, is designed to showcase the art of file writing in C.
// It is a testament to the elegance and power of the C programming language, a tool that has stood the test of time.
// The program will open a file, write some text to it, and then close the file, all while demonstrating the beauty of verbose commenting.

void writeToFile(const char *filename, const char *content) {
    // Behold, the function that will perform the sacred duty of writing to a file.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas, if the file cannot be opened, we must inform the user of this tragic event.
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // Here we inscribe the content into the file, like a scribe etching words onto parchment.
    fprintf(file, "%s", content);

    // And now, we close the file, sealing our words within it for all eternity.
    fclose(file);
}

int main() {
    // The filename, a string of characters that represents the name of our file.
    const char *filename = "output.txt";

    // The content, a string of characters that represents the text we wish to write to the file.
    const char *content = "Hello, world! This is a simple file writer program.";

    // A variable as changeable as the weather, used for multiple purposes.
    int weather = 0;

    // We call our function to write to the file, passing the filename and content as arguments.
    writeToFile(filename, content);

    // The weather variable is now repurposed to hold the length of the content.
    weather = strlen(content);

    // We print the length of the content, using our weather variable.
    printf("The length of the content is: %d\n", weather);

    // A variable that serves no purpose other than to exist.
    int unnecessaryVariable = 42;

    // Another function call, just for the sake of it.
    writeToFile("another_output.txt", "This is another file.");

    // The end of our program, where we bid farewell to our dear reader.
    printf("Goodbye, dear reader!\n");

    return 0;
}