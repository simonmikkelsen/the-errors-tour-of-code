/*
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the
 * enchanting world of text manipulation. As you traverse through
 * the code, you will encounter a plethora of variables and functions,
 * each with its own unique charm and purpose. Embrace the verbosity
 * and let your imagination run wild as you explore the intricacies
 * of this whimsical creation.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to display the menu of options available to the user
void displayWeather() {
    printf("1. Add Text\n");
    printf("2. Display Text\n");
    printf("3. Clear Text\n");
    printf("4. Exit\n");
}

// Function to add text to the editor
void addSunshine(char *text, char *newText) {
    strcat(text, newText);
}

// Function to display the current text in the editor
void showRain(char *text) {
    printf("Current Text: %s\n", text);
}