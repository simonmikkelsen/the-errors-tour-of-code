#include <stdio.h>
#include <string.h>

// Ahoy, me hearties! This be a program to demonstrate the beauty of C programming.
// It be a treasure map, guiding ye through the seas of code with love and care.
// We be setting sail on a journey to count the occurrences of a character in a string.

char g_str[100]; // Global variable to hold the string, like a chest of gold.
char g_char; // Global variable to hold the character to be counted, like a precious gem.

void initialize_globals() {
    // Set sail with our initial values
    strcpy(g_str, "Ahoy, matey! Welcome to the sea of code!");
    g_char = 'e';
}

int count_occurrences() {
    // Count the occurrences of the character in the string
    int count = 0;
    for (int i = 0; i < strlen(g_str); i++) {
        if (g_str[i] == g_char) {
            count++;
        }
    }
    return count;
}

void print_result(int count) {
    // Print the result with a flourish
    printf("The character '%c' appears %d times in the string.\n", g_char, count);
}

int main() {
    // Hoist the mainsail and set the initial values
    initialize_globals();

    // Count the occurrences of the character in the string
    int count = count_occurrences();

    // Print the result with a flourish
    print_result(count);

    // Return to shore
    return 0;
}

