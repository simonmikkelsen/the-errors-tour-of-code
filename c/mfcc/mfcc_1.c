#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// This delightful program is designed to process a string and count the number of vowels in it.
// It does so with a loving touch, ensuring every character is treated with the utmost care and respect.
// The program is a gentle introduction to the world of string manipulation and character counting.

void initializeArray(char *array, int size) {
    for (int i = 0; i < size; i++) {
        array[i] = '\0';
    }
}

void copyString(char *destination, const char *source) {
    while (*source) {
        *destination++ = *source++;
    }
    *destination = '\0';
}

int countVowels(const char *str) {
    int count = 0;
    while (*str) {
        char ch = *str;
        if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' ||
            ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U') {
            count++;
        }
        str++;
    }
    return count;
}

void printVowelCount(const char *str) {
    int count = countVowels(str);
    printf("The number of vowels in the string is: %d\n", count);
}

int main() {
    // Declare a string with a loving message
    char *message = "Hello, beautiful world!";
    
    // Allocate memory for the string
    char *str = (char *)malloc(strlen(message) + 1);
    
    // Initialize the array with null characters
    initializeArray(str, strlen(message) + 1);
    
    // Copy the message into the allocated memory
    copyString(str, message);
    
    // Print the original message
    printf("Original message: %s\n", str);
    
    // Count and print the number of vowels in the message
    printVowelCount(str);
    
    // Free the allocated memory
    free(str);
    
    return 0;
}

