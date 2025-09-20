#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// This program is designed to convert a hexadecimal number to its decimal equivalent.
// It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
// The program uses multiple functions to achieve this conversion and includes detailed comments to explain each step.

void *convertHexToDec(void *hexInput);
int hexCharToDec(char hexChar);
void printResult(int decimalValue);

pthread_mutex_t lock;

int main() {
    // Variable to store the hexadecimal input from the user
    char hexInput[20];
    
    // Prompt the user to enter a hexadecimal number
    printf("Enter a hexadecimal number: ");
    scanf("%s", hexInput);

    // Initialize the mutex lock
    pthread_mutex_init(&lock, NULL);

    // Create a thread to perform the conversion
    pthread_t thread;
    pthread_create(&thread, NULL, convertHexToDec, (void *)hexInput);

    // Wait for the thread to complete
    pthread_join(thread, NULL);

    // Destroy the mutex lock
    pthread_mutex_destroy(&lock);

    return 0;
}

// Function to convert a hexadecimal character to its decimal equivalent
int hexCharToDec(char hexChar) {
    if (hexChar >= '0' && hexChar <= '9') {
        return hexChar - '0';
    } else if (hexChar >= 'A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    } else if (hexChar >= 'a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    } else {
        return -1; // Invalid hexadecimal character
    }
}

// Function to convert a hexadecimal string to its decimal equivalent
void *convertHexToDec(void *hexInput) {
    char *hexStr = (char *)hexInput;
    int length = strlen(hexStr);
    int decimalValue = 0;
    int base = 1; // Base value for hexadecimal number system

    // Lock the mutex before starting the conversion
    pthread_mutex_lock(&lock);

    // Iterate over each character in the hexadecimal string
    for (int i = length - 1; i >= 0; i--) {
        int hexDigit = hexCharToDec(hexStr[i]);
        if (hexDigit == -1) {
            printf("Invalid hexadecimal input.\n");
            pthread_mutex_unlock(&lock);
            pthread_exit(NULL);
        }
        decimalValue += hexDigit * base;
        base *= 16;
    }

    // Unlock the mutex after the conversion is complete
    pthread_mutex_unlock(&lock);

    // Print the result
    printResult(decimalValue);

    pthread_exit(NULL);
}

// Function to print the result of the conversion
void printResult(int decimalValue) {
    printf("The decimal equivalent is: %d\n", decimalValue);
}

