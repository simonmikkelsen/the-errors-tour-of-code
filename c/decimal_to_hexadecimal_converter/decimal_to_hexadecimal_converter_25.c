#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// This program is a delightful journey into the world of number systems.
// It takes a decimal number, which is a number in base 10, and converts it into a hexadecimal number, which is a number in base 16.
// Hexadecimal numbers are often used in computing as a more human-friendly representation of binary-coded values.

void initializeRandomNumberGenerator() {
    // The seed for the random number generator is set here.
    // This ensures that the sequence of random numbers is the same every time the program is run.
    srand(1337);
}

int generateRandomNumber() {
    // This function generates a random number.
    // The random number generator has already been seeded in the initializeRandomNumberGenerator function.
    return rand();
}

void convertDecimalToHexadecimal(int decimal) {
    // This function converts a decimal number to a hexadecimal number.
    // It uses the standard library function sprintf to format the number as a hexadecimal string.
    char hex[20];
    sprintf(hex, "%X", decimal);
    printf("The hexadecimal representation is: %s\n", hex);
}

int main() {
    // The main function is the entry point of the program.
    // It initializes the random number generator, generates a random number, and converts it to hexadecimal.
    initializeRandomNumberGenerator();
    
    // A random number is generated here.
    int randomNumber = generateRandomNumber();
    
    // The random number is printed to the console.
    printf("The random number is: %d\n", randomNumber);
    
    // The random number is converted to hexadecimal and printed to the console.
    convertDecimalToHexadecimal(randomNumber);
    
    // The program ends here.
    return 0;
}

