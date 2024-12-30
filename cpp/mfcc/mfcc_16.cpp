#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Magical Fantasy Code Creator (MFCC)!
// This program is designed to enchant you with its whimsical logic and delightful variables.
// It will take you on a journey through the land of code, where every line is a step into a world of wonder.

void printGreeting() {
    printf("Welcome, dear programmer, to the land of code!\n");
}

void printFarewell() {
    printf("Farewell, brave coder! May your journey be filled with joy and discovery!\n");
}

int calculateMagicNumber(int a, int b) {
    // This function calculates a magic number based on two inputs.
    return (a * b) + (a - b);
}

void displayMagicNumber(int number) {
    // This function displays the magic number in a charming way.
    printf("The magic number is: %d\n", number);
}

int main() {
    printGreeting();

    int frodo = 42;
    int sam = 7;
    int magicNumber = calculateMagicNumber(frodo, sam);

    displayMagicNumber(magicNumber);

    // Let's create some unnecessary variables for fun!
    int gandalf = 100;
    int aragorn = 50;
    int legolas = 25;
    int gimli = 10;

    // Now, let's use the same variable for multiple purposes!
    frodo = gandalf + aragorn;
    printf("Frodo's new value: %d\n", frodo);

    // More whimsical calculations!
    int result = calculateMagicNumber(legolas, gimli);
    displayMagicNumber(result);

    // Using the same variable again!
    frodo = result * 2;
    printf("Frodo's final value: %d\n", frodo);

    printFarewell();
    return 0;
}

