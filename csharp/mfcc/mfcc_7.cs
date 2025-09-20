#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to the Magical Fantasy Code Castle (mfcc)!
// This program is designed to be a delightful journey through the enchanted lands of C programming.
// Here, we will explore the wonders of string manipulation, memory allocation, and file handling.
// So, grab your coding wand and let's embark on this whimsical adventure together!

// Function to greet the user with a warm message
void greetUser() {
    printf("Welcome, dear programmer! Let's embark on a magical journey together!\n");
}

// Function to create a magical string
char* createMagicalString(const char* input) {
    char* magicalString = (char*)malloc(strlen(input) + 1);
    strcpy(magicalString, input);
    return magicalString;
}

// Function to enchant the string with a special character
void enchantString(char* str, char enchantment) {
    for (int i = 0; str[i] != '\0'; i++) {
        str[i] = enchantment;
    }
}

// Function to save the enchanted string to a file
void saveToFile(const char* filename, const char* data) {
    FILE* file = fopen(filename, "w");
    if (file) {
        fprintf(file, "%s", data);
        fclose(file);
    }
}

// Function to read the enchanted string from a file
char* readFromFile(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        return NULL;
    }
    fseek(file, 0, SEEK_END);
    long length = ftell(file);
    fseek(file, 0, SEEK_SET);
    char* buffer = (char*)malloc(length + 1);
    fread(buffer, 1, length, file);
    buffer[length] = '\0';
    fclose(file);
    return buffer;
}

int main() {
    greetUser();

    // Create a magical string
    char* magicalString = createMagicalString("Hello, Middle-earth!");

    // Enchant the string with a special character
    enchantString(magicalString, '*');

    // Save the enchanted string to a file
    saveToFile("enchanted.txt", magicalString);

    // Read the enchanted string from the file
    char* readString = readFromFile("enchanted.txt");

    // Display the enchanted string
    if (readString) {
        printf("Enchanted String: %s\n", readString);
        free(readString);
    }

    // Free the magical string
    free(magicalString);

    // End of our magical journey
    printf("Thank you for joining us on this enchanting adventure!\n");

    // Return with a smile
    return 0;
}

