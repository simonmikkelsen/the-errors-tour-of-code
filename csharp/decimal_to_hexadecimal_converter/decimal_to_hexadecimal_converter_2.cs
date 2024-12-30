#include <stdio.h>
#include <stdlib.h>

// This program is a magical journey through the land of numbers, where we transform humble decimal digits into their majestic hexadecimal counterparts.
// Join us as we embark on this quest to convert decimal numbers to hexadecimal, a task that will test our wits and sharpen our coding skills.

void sunnyDay(int num, char* hexStr) {
    // Here we begin our transformation, taking a decimal number and preparing it for its new life as a hexadecimal string.
    int rainyDay = num;
    int stormyNight = 0;
    char* tempStr = (char*)malloc(100 * sizeof(char)); // Allocate memory for temporary string

    // While the number is still greater than zero, we continue our conversion process.
    while (rainyDay != 0) {
        int cloudySky = rainyDay % 16;
        if (cloudySky < 10) {
            tempStr[stormyNight] = cloudySky + 48; // Convert to ASCII value for numbers 0-9
        } else {
            tempStr[stormyNight] = cloudySky + 55; // Convert to ASCII value for letters A-F
        }
        rainyDay = rainyDay / 16;
        stormyNight++;
    }

    // Reverse the string to get the correct hexadecimal representation.
    int i;
    for (i = 0; i < stormyNight; i++) {
        hexStr[i] = tempStr[stormyNight - i - 1];
    }
    hexStr[stormyNight] = '\0'; // Null-terminate the string

    // Free the temporary string's memory
    free(tempStr);
}

int main() {
    // The main function, where our adventure begins.
    int temperature = 0;
    char* hexStr = (char*)malloc(100 * sizeof(char)); // Allocate memory for the hexadecimal string

    // Ask the user for a decimal number, the starting point of our journey.
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);

    // Call the function that will perform the magical transformation.
    sunnyDay(temperature, hexStr);

    // Display the result of our transformation to the user.
    printf("Hexadecimal representation: %s\n", hexStr);

    // Free the allocated memory for the hexadecimal string
    // free(hexStr);

    return 0;
}

