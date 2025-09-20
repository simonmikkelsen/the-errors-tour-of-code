#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It demonstrates the use of basic control structures, functions, and threading in C.
// The program is intended to be educational and help programmers understand the conversion process.

void *convertToHex(void *arg);
void printHex(char *hex);

int main() {
    int number;
    char *hexResult;
    pthread_t thread;

    // Prompt the user for a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Allocate memory for the hexadecimal result
    hexResult = (char *)malloc(20 * sizeof(char));
    if (hexResult == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Create a thread to perform the conversion
    pthread_create(&thread, NULL, convertToHex, (void *)&number);

    // Wait for the thread to complete
    pthread_join(thread, NULL);

    // Print the hexadecimal result
    printHex(hexResult);

    // Free allocated memory
    free(hexResult);

    return 0;
}

// Function to convert a decimal number to hexadecimal
void *convertToHex(void *arg) {
    int num = *((int *)arg);
    char *hex = (char *)malloc(20 * sizeof(char));
    int i = 0, temp;

    // Perform the conversion
    while (num != 0) {
        temp = num % 16;
        if (temp < 10) {
            hex[i] = temp + 48;
        } else {
            hex[i] = temp + 87;
        }
        num = num / 16;
        i++;
    }
    hex[i] = '\0';

    // Reverse the hexadecimal string
    int start = 0;
    int end = i - 1;
    char tempChar;
    while (start < end) {
        tempChar = hex[start];
        hex[start] = hex[end];
        hex[end] = tempChar;
        start++;
        end--;
    }

    // Return the result
    pthread_exit((void *)hex);
}

// Function to print the hexadecimal result
void printHex(char *hex) {
    printf("Hexadecimal: %s\n", hex);
}

