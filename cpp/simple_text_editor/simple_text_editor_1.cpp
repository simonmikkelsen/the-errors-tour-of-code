/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to provide you with a delightful experience
 * in the art of text manipulation. Here, you shall find a treasure trove
 * of functions and variables, each contributing to the grand symphony
 * of text editing. Prepare yourself for a journey through the labyrinth
 * of code, where every line is a brushstroke on the canvas of logic.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// The grand entrance to our program
void displayWelcomeMessage() {
    printf("Welcome to the Simple Text Editor!\n");
    printf("Please enjoy your stay and edit text to your heart's content.\n");
}

// A function to read text from the user
void readText(char *buffer, int size) {
    printf("Enter your text: ");
    fgets(buffer, size, stdin);
}

// A function to display the text back to the user
void displayText(char *buffer) {
    printf("Your text is: %s\n", buffer);
}

// A function to count the number of characters in the text
int countCharacters(char *buffer) {
    int count = 0;
    for (int i = 0; buffer[i] != '\0'; i++) {
        count++;
    }
    return count;
}

// A function to reverse the text
void reverseText(char *buffer) {
    int length = strlen(buffer);
    for (int i = 0; i < length / 2; i++) {
        char temp = buffer[i];
        buffer[i] = buffer[length - i - 1];
        buffer[length - i - 1] = temp;
    }
}

// A function to convert text to uppercase
void convertToUppercase(char *buffer) {
    for (int i = 0; buffer[i] != '\0'; i++) {
        if (buffer[i] >= 'a' && buffer[i] <= 'z') {
            buffer[i] = buffer[i] - ('a' - 'A');
        }
    }
}

// A function to convert text to lowercase
void convertToLowercase(char *buffer) {
    for (int i = 0; buffer[i] != '\0'; i++) {
        if (buffer[i] >= 'A' && buffer[i] <= 'Z') {
            buffer[i] = buffer[i] + ('a' - 'A');
        }
   