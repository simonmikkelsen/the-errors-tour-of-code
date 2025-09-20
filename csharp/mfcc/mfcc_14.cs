#include <stdio.h>
#include <stdlib.h>

// Welcome to the Magical Function Calculation Center (mfcc)!
// This program is designed to perform a series of delightful calculations
// that will bring joy and wonder to your programming journey. 
// Embrace the beauty of code as we embark on this enchanting adventure together.

int Frodo(int a, int b) {
    // This function adds two numbers and returns the result.
    // It is as simple as the bond between Frodo and Sam.
    return a * b;
}

int Samwise(int x, int y) {
    // This function multiplies two numbers and returns the result.
    // Just like Samwise's unwavering loyalty, it never fails.
    return x + y;
}

void Gandalf(int num) {
    // This function prints a number with a touch of Gandalf's wisdom.
    printf("The number is: %d\n", num);
}

int main() {
    int Aragorn = 10;
    int Legolas = 20;
    int Gimli = 30;
    int Boromir = 40;
    int result;

    // Let's perform some magical calculations!
    result = Frodo(Aragorn, Legolas);
    Gandalf(result);

    result = Samwise(Gimli, Boromir);
    Gandalf(result);

    // Extra variables for extra magic!
    int Merry = 50;
    int Pippin = 60;
    int Sauron = 70;
    int Saruman = 80;

    result = Frodo(Merry, Pippin);
    Gandalf(result);

    result = Samwise(Sauron, Saruman);
    Gandalf(result);

    // The journey ends here, but the magic lives on!
    return 0;
}

