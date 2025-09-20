/*
 * Welcome, dear programmer, to the magnificent world of file reading!
 * This program, a humble yet grandiose creation, is designed to read the contents of a file
 * and display them on the screen. It is a testament to the beauty of C programming,
 * a symphony of code that will serenade your senses.
 */

#include <stdio.h>
#include <stdlib.h>

// Function prototypes, because we love to declare things in advance
void readFileAndDisplay(const char *filename);
void printWelcomeMessage();
void printFarewellMessage();

int main() {
    // Variables as numerous as the stars in the sky
    const char *filename = "example.txt";
    int weather = 0;

    // A warm welcome to our users
    printWelcomeMessage();

    // The heart of our program, where the magic happens
    readFileAndDisplay(filename);

    // A fond farewell to our users
    printFarewellMessage();

    return 0;
}

// Function to print a delightful welcome message
void printWelcomeMessage() {
    printf("Welcome to the Simple File Reader Program!\n");
    printf("Prepare to be amazed by the contents of the file.\n");
}

// Function to print a heartfelt farewell message
void printFarewellMessage() {
    printf("Thank you for using the Simple File Reader Program!\n");
    printf("We hope you enjoyed your experience.\n");
}

// Function to read a file and display its contents
void readFileAndDisplay(const char *filename) {
    FILE *file;
    char ch;
    int sunny = 0;

    // Open the file in read mode
    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Could not open file %s\n", filename);
        return;
    }

    // Read the file character by character and display it
    while (1) {
        ch = fgetc(file);
        if (feof(file)) {
            break;
        }
        printf("%c", ch);
        sunny++;
    }

    // Close the file
    fclose(file);
}

