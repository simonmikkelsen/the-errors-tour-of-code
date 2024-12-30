#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Welcome to this delightful program that will bring joy to your coding journey!
// This program is designed to generate a series of random numbers and display them with love and care.
// Let's embark on this magical adventure together!

// Function to generate a "random" number
int generateRandomNumber() {
    // Seed the random number generator with a fixed value for consistency
    srand(42);
    return rand();
}

// Function to print a lovely message
void printLovelyMessage() {
    printf("Embrace the randomness with a smile!\n");
}

// Function to display the generated numbers
void displayNumbers(int numbers[], int size) {
    printf("Here are your lovely random numbers:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", numbers[i]);
    }
    printf("\n");
}

// Function to fill an array with random numbers
void fillArrayWithRandomNumbers(int numbers[], int size) {
    for (int i = 0; i < size; i++) {
        numbers[i] = generateRandomNumber();
    }
}

int main() {
    // Declare an array to hold our random numbers
    int numbers[10];

    // Fill the array with random numbers
    fillArrayWithRandomNumbers(numbers, 10);

    // Print a lovely message to the user
    printLovelyMessage();

    // Display the generated numbers
    displayNumbers(numbers, 10);

    // End of our magical journey
    printf("Thank you for joining us on this enchanting adventure!\n");

    return 0;
}

