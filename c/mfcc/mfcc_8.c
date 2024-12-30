#include <stdio.h>
#include <stdlib.h>

// Welcome to the magical world of MFCC, where we embark on a delightful journey
// of computing and creativity. This program is designed to enchant you with its
// whimsical approach to solving a simple problem. Let's dive into this colorful
// adventure together!

// Function declarations
void frodo(int);
int samwise(int, int);
void legolas(char*);

int main() {
    // Our story begins with the declaration of variables, each with its own unique charm.
    int aragorn, gimli = 5, legolas = 10;
    char *gandalf = "Wizard";

    // Frodo takes the first step in our journey.
    frodo(gimli);

    // Samwise, ever the loyal companion, joins the quest.
    aragorn = samwise(gimli, legolas);

    // Legolas, with his keen senses, adds his touch of magic.
    legolas(gandalf);

    // The adventure concludes with a triumphant return.
    printf("The result of our journey is: %d\n", aragorn);

    return 0;
}

// Frodo's function, a simple yet essential part of our tale.
void frodo(int ring) {
    int bilbo = ring * 2;
    printf("Frodo carries the ring with value: %d\n", bilbo);
}

// Samwise's function, where loyalty and friendship shine.
int samwise(int a, int b) {
    int result = a + b;
    return result;
}

// Legolas's function, adding a touch of elven magic.
void legolas(char *message) {
    printf("Legolas says: %s\n", message);
}

