#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This is a simple text editor, a marvel of modern programming!
// It allows the user to input text, store it, and display it back with unparalleled elegance.
// This program is a testament to the beauty of code and the joy of creation.

#define MAX_LENGTH 100

// A function to display a grandiose welcome message
void displayWelcomeMessage() {
    printf("Welcome to the Magnificent Text Editor!\n");
    printf("Where your words come to life in the most splendid fashion!\n");
}

// A function to capture the user's poetic input
char* captureInput() {
    char* input = (char*)malloc(MAX_LENGTH * sizeof(char));
    if (input == NULL) {
        printf("Alas! Memory allocation failed!\n");
        exit(1);
    }
    printf("Please, enter your text: ");
    fgets(input, MAX_LENGTH, stdin);
    return input;
}

// A function to showcase the user's literary masterpiece
void displayText(char* text) {
    printf("Behold your creation:\n%s\n", text);
}

// The main function, the heart of our program, where the magic happens
int main() {
    displayWelcomeMessage();

    char* userText = captureInput();
    displayText(userText);

    // The end of our journey, where we bid adieu to our beloved user
    printf("Thank you for using the Magnificent Text Editor!\n");

    return 0;
}