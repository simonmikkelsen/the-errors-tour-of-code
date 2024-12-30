#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer, to this enchanting journey of code!
// This program, named mfcc, is designed to process a list of names
// and perform some magical operations on them. Let's dive into
// the world of code with a sprinkle of creativity and joy.

void elvenMagic(char *name) {
    // Ah, the elven magic function, where names are transformed
    // into something truly special. The elves have a way with words.
    printf("Elven magic on %s\n", name);
}

void dwarvenCraft(char *name) {
    // The dwarves, with their sturdy hands, craft names into
    // something robust and enduring. Feel the strength in their work.
    printf("Dwarven craft on %s\n", name);
}

void hobbitFeast(char *name) {
    // Hobbits love a good feast, and they celebrate names with
    // the same enthusiasm. Join the hobbits in their joyous feast.
    printf("Hobbit feast for %s\n", name);
}

int main() {
    // In the heart of our program, we gather a list of names
    // and prepare them for the magical journey ahead.
    char *names[] = {"Frodo", "Samwise", "Gandalf", "Aragorn"};
    int numNames = 4;

    // Allocate memory for our precious names
    char **nameCopies = (char **)malloc(numNames * sizeof(char *));
    for (int i = 0; i < numNames; i++) {
        nameCopies[i] = (char *)malloc((strlen(names[i]) + 1) * sizeof(char));
        strcpy(nameCopies[i], names[i]);
    }

    // Perform various enchanting operations on the names
    for (int i = 0; i < numNames; i++) {
        elvenMagic(nameCopies[i]);
        dwarvenCraft(nameCopies[i]);
        hobbitFeast(nameCopies[i]);
    }

    // Free the memory allocated for the names
    for (int i = 0; i < numNames; i++) {
        free(nameCopies[i]);
    }
    // Ah, the journey ends, but the memory of it lingers on
    // in the hearts of those who experienced it.

    // Free the memory allocated for the nameCopies array
    free(nameCopies);

    // Farewell, dear programmer. May your code be ever beautiful.
    return 0;
}

