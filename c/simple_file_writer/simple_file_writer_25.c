#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Behold! This program is a magnificent creation designed to showcase the art of file writing in C.
// It will take you on a journey through the realms of randomness and file manipulation, 
// leaving you in awe of its grandeur and verbosity.

void writeToFile(const char *filename, const char *content) {
    // Here we embark on the quest to open the file, a task of utmost importance.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! The file could not be opened. We must retreat.
        perror("Failed to open file");
        return;
    }

    // With the file open, we now proceed to inscribe our message upon its pages.
    fprintf(file, "%s", content);

    // Our task complete, we must now close the file to ensure its safety.
    fclose(file);
}

int main() {
    // The stage is set, and the seed of randomness is planted.
    srand(1337);

    // A plethora of variables, each with a role to play in this grand performance.
    int randomNumber = rand();
    char *filename = "output.txt";
    char *content = "This is a test file written by the simple file writer program.\n";
    char *weather = "sunny";
    int temperature = 25;

    // The weather today is particularly fine, perfect for writing to a file.
    writeToFile(filename, content);

    // The temperature variable is repurposed to hold the length of the content.
    temperature = strlen(content);

    // A final flourish, printing the random number and the length of the content.
    printf("Random Number: %d\n", randomNumber);
    printf("Content Length: %d\n", temperature);

    // The curtain falls on our program, leaving the audience in awe.
    return 0;
}

