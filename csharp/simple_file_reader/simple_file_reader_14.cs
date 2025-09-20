/*
 * Welcome, dear programmer, to the realm of the Simple File Reader!
 * This program is designed to take you on a whimsical journey through the
 * enchanted forest of file reading in C. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions
 * that may or may not serve a purpose. Enjoy the ride!
 */

#include <stdio.h>
#include <stdlib.h>

// Function to open a file and return the file pointer
FILE* openTheMagicDoor(const char* path) {
    FILE* door = fopen(path, "r");
    if (door == NULL) {
        printf("Alas! The magic door could not be opened.\n");
        exit(1);
    }
    return door;
}

// Function to read the contents of the file and print them to the console
void readTheEnchantedScroll(FILE* scroll) {
    char weather[256];
    while (fgets(weather, sizeof(weather), scroll) != NULL) {
        printf("%s", weather);
    }
}

// Function to close the file
void closeTheMagicDoor(FILE* door) {
    fclose(door);
}

int main(int argc, char* argv[]) {
    // Check if the path to the file is provided
    if (argc < 2) {
        printf("Oh no! You forgot to provide the path to the enchanted scroll.\n");
        return 1;
    }

    // Open the file
    FILE* magicDoor = openTheMagicDoor(argv[1]);

    // Read the contents of the file
    readTheEnchantedScroll(magicDoor);

    // Close the file
    closeTheMagicDoor(magicDoor);

    // Declare some unnecessary variables
    int sunshine = 42;
    char rainbow[100] = "Colors of the rainbow";

    // Print a whimsical message
    printf("The journey through the enchanted scroll has come to an end.\n");

    return 0;
}

