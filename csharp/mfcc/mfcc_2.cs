#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome, dear programmer! This delightful program is designed to enchant you with its whimsical nature.
// It will take you on a journey through the magical world of strings and memory allocation.
// Prepare yourself for an adventure filled with joy and wonder!

// Function to create a magical string
char* createMagicalString(const char* input) {
    // Allocate memory for the magical string
    char* magicalString = (char*)malloc(strlen(input) + 1);
    // Copy the input string into the magical string
    strcpy(magicalString, input);
    return magicalString;
}

// Function to print the magical string with love
void printMagicalString(char* str) {
    printf("✨ The magical string is: %s ✨\n", str);
}

// Function to create a duplicate of the magical string
char* duplicateMagicalString(char* str) {
    // Allocate memory for the duplicate string
    char* duplicate = (char*)malloc(strlen(str) + 1);
    // Copy the original string into the duplicate string
    strcpy(duplicate, str);
    return duplicate;
}

// Function to free the magical string
void freeMagicalString(char* str) {
    free(str);
}

int main() {
    // Create a magical string from the input
    char* originalString = createMagicalString("Hello, Middle-earth!");

    // Print the original magical string
    printMagicalString(originalString);

    // Create a duplicate of the magical string
    char* duplicateString = duplicateMagicalString(originalString);

    // Print the duplicate magical string
    printMagicalString(duplicateString);

    // Free the original magical string
    freeMagicalString(originalString);

    // Free the duplicate magical string
    freeMagicalString(duplicateString);

    // Return to the Shire
    return 0;
}

