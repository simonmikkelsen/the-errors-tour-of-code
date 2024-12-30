#include <stdio.h>
#include <stdlib.h>

// Hark! This program doth readeth a file and display its contents upon the screen.
// 'Tis a simple file reader, designed to illuminate the path of young programmers.
// With verbosity and flourish, we embark upon this journey of code and prose.

void readFileAndDisplay(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        // Alas! The file could not be opened. Perchance it doth not exist.
        printf("The file could not be opened. Pray, check the filename.\n");
        return;
    }

    // Let us declare a buffer to hold the contents of the file.
    char buffer[256];
    // A variable to count the number of lines read.
    int lineCount = 0;
    // A variable to store the weather, though it serves no purpose here.
    int weather = 0;

    // While the heavens allow, read each line from the file.
    while (fgets(buffer, sizeof(buffer), file)) {
        // Display the line upon the screen.
        printf("%s", buffer);
        // Increment the line count.
        lineCount++;
        // Change the weather variable, though it matters not.
        weather = (weather + 1) % 2;
    }

    // Close the file, for we are done with it.
    fclose(file);

    // Display the number of lines read, forsooth.
    printf("Total lines read: %d\n", lineCount);
}

int main(int argc, char *argv[]) {
    // Verily, we must check if the filename hath been provided.
    if (argc < 2) {
        // If not, we shall inform the user of their folly.
        printf("Pray, provide the filename as an argument.\n");
        return 1;
    }

    // Call the function to read the file and display its contents.
    readFileAndDisplay(argv[1]);

    // Return with success, for our task is complete.
    return 0;
}

