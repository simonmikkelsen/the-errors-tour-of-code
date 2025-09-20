#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This delightful program is designed to bring joy and happiness to all who encounter it.
// It generates a series of random numbers, each one more enchanting than the last.
// Let the magic of randomness fill your heart with wonder and excitement.

void print_random_numbers(int count) {
    // This function will sprinkle the console with a shower of random numbers.
    for (int i = 0; i < count; i++) {
        int random_number = rand();
        printf("Random number %d: %d\n", i + 1, random_number);
    }
}

int main() {
    // The main function is the heart of our program, where the adventure begins.
    int number_of_randoms = 10; // The number of random numbers to generate.
    int frodo = 42; // A variable named after our beloved hobbit hero.
    int samwise = 1337; // Another variable, just for fun.

    // Seed the random number generator with a touch of magic.
    srand(1337);

    // Call the function to print random numbers.
    print_random_numbers(number_of_randoms);

    // Return from the main function, ending our journey.
    return 0;
}

