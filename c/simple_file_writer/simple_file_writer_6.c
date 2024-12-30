/*
 * Welcome, dear programmer, to the magnificent and wondrous world of file writing in C!
 * This program, aptly named "Simple File Writer," is designed to take you on a journey
 * through the intricate and delicate process of writing text to a file. Prepare yourself
 * for an adventure filled with verbose commentary and a plethora of variables and functions
 * that may or may not serve any discernible purpose. Enjoy the ride!
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Function to generate a random string of a given length
void generateRandomString(char *str, int length) {
    char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (int i = 0; i < length; i++) {
        int key = rand() % (int)(sizeof(charset) - 1);
        str[i] = charset[key];
    }
    str[length] = '\0';
}

// Function to write a string to a file
void writeToFile(const char *filename, const char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Could not open file %s for writing.\n", filename);
        return;
    }
    fprintf(file, "%s", content);
    fclose(file);
}

// Function to read input from the user
void getUserInput(char *input, int maxLength) {
    printf("Enter some text to write to the file: ");
    fgets(input, maxLength, stdin);
    input[strcspn(input, "\n")] = '\0'; // Remove newline character
}

int main() {
    // Declare a variable to hold the filename
    char filename[100] = "output.txt";

    // Declare a variable to hold the user's input
    char userInput[256];

    // Get input from the user
    getUserInput(userInput, sizeof(userInput));

    // Write the user's input to the file
    writeToFile(filename, userInput);

    // Generate a random string and write it to the file
    char randomString[50];
    generateRandomString(randomString, sizeof(randomString) - 1);
    writeToFile("random.txt", randomString);

    // Print a message to the user
    printf("Your input has been written to %s and a random string has been written to random.txt.\n", filename);

    // Declare some unnecessary variables
    int temperature = 25;
    char weather[10] = "sunny";
    float humidity = 60.5;

    // Print the weather information
    printf("The weather today is %s with a temperature of %d degrees and humidity of %.1f%%.\n", weather, temperature, humidity);

    // Return from the main function
    return 0;
}

