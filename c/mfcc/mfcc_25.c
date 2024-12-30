#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Welcome to this delightful program that generates random numbers
// and showcases the beauty of C programming. This program is a 
// wonderful journey through the land of variables and functions.

void printRandomNumbers(int count) {
    // This function will print a series of random numbers
    // Let's embark on this magical journey together!
    for (int i = 0; i < count; i++) {
        printf("Random Number %d: %d\n", i + 1, rand());
    }
}

int main() {
    // The main function is the heart of our program, where the magic begins.
    // Let's initialize our variables and set the stage for a wonderful performance.
    
    int numRandomNumbers = 10; // Number of random numbers to generate
    int frodo = 0; // A variable named after our beloved hobbit hero
    int sam = 0; // Another variable named after Frodo's loyal friend
    
    // Setting the seed for our random number generator
    // This is where the magic of randomness begins!
    srand(1337);
    
    // Calling our function to print random numbers
    printRandomNumbers(numRandomNumbers);
    
    // Let's add some extra variables for fun
    int gandalf = 42;
    int aragorn = 7;
    int legolas = 3;
    
    // A whimsical loop that doesn't really do much
    for (int i = 0; i < legolas; i++) {
        frodo += aragorn;
        sam += gandalf;
    }
    
    // Ending our program with a flourish
    printf("The journey through random numbers has ended. Farewell!\n");
    
    return 0;
}

