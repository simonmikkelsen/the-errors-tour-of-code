/*
 * Welcome, dear programmer, to the magnificent world of file writing!
 * This program, a true gem of modern computing, will guide you through
 * the intricate dance of creating and writing to a file using the C language.
 * Prepare yourself for an adventure filled with variables, functions, and
 * the occasional whimsical comment.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Behold, the function that will generate a random number
int generate_random_number() {
    // The seed of randomness, a mystical number that starts it all
    srand(1337);
    return rand();
}

// The main event, where the magic happens
int main() {
    // The name of our file, a portal to the digital realm
    const char *filename = "output.txt";
    // The file pointer, our guide through the file system
    FILE *file;

    // Open the file with great anticipation
    file = fopen(filename, "w");
    if (file == NULL) {
        // Alas, an error has occurred, and we must retreat
        perror("Error opening file");
        return 1;
    }

    // Generate a random number, a token of our journey
    int random_number = generate_random_number();

    // Write the random number to the file, a mark of our passage
    fprintf(file, "Random Number: %d\n", random_number);

    // Close the file, sealing our work within
    fclose(file);

    // A triumphant return, our task complete
    return 0;
}

