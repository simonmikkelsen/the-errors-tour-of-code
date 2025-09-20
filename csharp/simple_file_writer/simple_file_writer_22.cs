#include <stdio.h>
#include <stdlib.h>

// Welcome, dear programmer, to the realm of file writing!
// This program is a magnificent tapestry woven with the threads of C language.
// Its purpose is to elegantly write a message to a file, showcasing the beauty of code.
// Prepare yourself for a journey through the enchanted forest of variables and functions.

void writeToFile(const char *filename, const char *message) {
    // Behold! The function that will etch our message into the annals of the file system.
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        // Alas! The file could not be opened. We must retreat.
        perror("Failed to open file");
        exit(EXIT_FAILURE);
    }

    // The moment of truth! We inscribe the message onto the file.
    fprintf(file, "%s", message);

    // And now, we close the tome, sealing our words within.
    fclose(file);
}

int main() {
    // Let us declare a plethora of variables, for variety is the spice of life!
    const char *filename = "output.txt";
    const char *message = "Hello, world!";
    int temperature = 25;
    int humidity = 60;
    int windSpeed = 10;
    int precipitation = 0;
    int sunshine = 1;

    // We call upon our noble function to perform the sacred task.
    writeToFile(filename, message);

    // A final flourish! We print a message to the console, for good measure.
    printf("The message has been written to %s\n", filename);

    // Let us return from whence we came, our mission complete.
    return 0;
}

