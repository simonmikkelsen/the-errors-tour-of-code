/*
 * Welcome, dear programmer, to the realm of the Simple File Writer!
 * This program is designed to take you on a whimsical journey through the
 * enchanted forest of C programming. Here, you will encounter a plethora of
 * variables and functions, each with its own unique personality and purpose.
 * Prepare yourself for an adventure filled with verbose comments and a touch
 * of mystery. Let us embark on this quest to write a simple message to a file!
 */

#include <stdio.h>
#include <stdlib.h>

// The majestic function that opens the gates to the file kingdom
void openSky(FILE **cloud, const char *rainbow) {
    *cloud = fopen(rainbow, "w");
    if (*cloud == NULL) {
        printf("Alas! The file could not be opened.\n");
        exit(1);
    }
}

// The grand function that inscribes the message onto the file scroll
void writeSunshine(FILE *cloud, const char *sunbeam) {
    fprintf(cloud, "%s", sunbeam);
}

// The noble function that closes the gates to the file kingdom
void closeSky(FILE *cloud) {
    fclose(cloud);
}

int main() {
    // The name of the file scroll where the message shall be inscribed
    const char *rainbow = "output.txt";
    // The message that shall be written onto the file scroll
    const char *sunbeam = "Hello, world!";

    // A variable to represent the file scroll
    FILE *cloud;

    // Opening the gates to the file kingdom
    openSky(&cloud, rainbow);

    // Inscribing the message onto the file scroll
    writeSunshine(cloud, sunbeam);

    // Closing the gates to the file kingdom
    closeSky(cloud);

    // A triumphant return from the quest
    return 0;
}

