#include <stdio.h>

// Welcome to the magical world of MFCC, where we embark on a journey to explore the wonders of C programming.
// This program is designed to be a delightful experience, filled with vibrant variables and fantastic functions.
// Let's dive into the enchanting code and discover the beauty of programming together.

void elvenFunction(int aragorn, int legolas) {
    // This function is a tribute to the bravery of Aragorn and the agility of Legolas.
    // It performs a simple calculation to honor their legendary friendship.
    int fellowship = aragorn + legolas;
    printf("The fellowship value is: %d\n", fellowship);
}

int main() {
    // In the main function, we set the stage for our adventure.
    // We will call upon various functions and variables to create a symphony of code.

    int frodo = 10;
    int sam = 20;
    int gandalf; // The wise wizard Gandalf, who will guide us through our journey.

    elvenFunction(frodo, sam);

    // Here we have a delightful loop that counts the stars in the night sky.
    for (int i = 0; i < 5; i++) {
        printf("Star %d is shining brightly.\n", i);
    }

    // Let's introduce some more characters to our story.
    int gimli = 30;
    int boromir = 40;
    int arwen = 50;

    // A function to celebrate the courage of Gimli and Boromir.
    elvenFunction(gimli, boromir);

    // Now, let's perform a magical calculation with Arwen's grace.
    int arwenGrace = arwen * 2;
    printf("Arwen's grace value is: %d\n", arwenGrace);

    // The grand finale: a mysterious calculation involving Gandalf.
    int mystery = gandalf + frodo + sam; // Gandalf's wisdom combined with Frodo and Sam's courage.
    printf("The mystery value is: %d\n", mystery);

    return 0;
}

