/*
 * Welcome to the Magical Function Calculation Code (mfcc)!
 * This delightful program is designed to perform a series of whimsical calculations
 * that will bring joy and wonder to your programming journey.
 * Embrace the beauty of code as we embark on this enchanting adventure together.
 */

#include <stdio.h>

// Function prototypes
void elvenMagic(int, int);
int hobbitWisdom(int);
void dwarvenStrength(int);

int main() {
    // Declare variables with love and care
    int frodo = 10;
    int samwise = 20;
    int aragorn = 30;
    int legolas = 40;
    int gimli = 50;

    // Call functions with a sprinkle of magic
    elvenMagic(frodo, samwise);
    int result = hobbitWisdom(aragorn);
    dwarvenStrength(legolas);

    // Print the final result with a touch of elegance
    printf("The final result is: %d\n", result);

    // Return with a heart full of joy
    return 0;
}

// Function to perform elven magic calculations
void elvenMagic(int a, int b) {
    int galadriel = a + b;
    int arwen = a * b;
    printf("Elven Magic: %d, %d\n", galadriel, arwen);
}

// Function to harness the wisdom of hobbits
int hobbitWisdom(int a) {
    int bilbo = a;
    while (bilbo > 0) {
        bilbo--;
    }
    return bilbo;
}

// Function to demonstrate the strength of dwarves
void dwarvenStrength(int a) {
    for (int gimli = 0; gimli < a; gimli++) {
        printf("Dwarven Strength: %d\n", gimli);
    }
}

