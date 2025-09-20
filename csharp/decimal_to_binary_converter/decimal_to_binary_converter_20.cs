/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a number from decimal to binary. The program takes an integer input 
 * from the user and then performs the conversion, displaying the result.
 * 
 * The program uses various functions and variables to achieve this goal. 
 * It is written in a verbose manner to provide clarity and understanding.
 */

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

#define MAX_BITS 32

// Function prototypes
void *convertToBinary(void *arg);
void printBinary(int binary[], int size);
void someUnusedFunction();

int main() {
    int number;
    int binary[MAX_BITS] = {0};
    pthread_t thread;

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Create a thread to perform the conversion
    pthread_create(&thread, NULL, convertToBinary, (void *)&number);

    // Wait for the thread to complete
    pthread_join(thread, NULL);

    // Print the binary result
    printBinary(binary, MAX_BITS);

    return 0;
}

// Function to convert a decimal number to binary
void *convertToBinary(void *arg) {
    int number = *((int *)arg);
    int binary[MAX_BITS];
    int index = 0;

    // Perform the conversion
    while (number > 0) {
        binary[index++] = number % 2;
        number = number / 2;
    }

    // Print the binary result
    printBinary(binary, index);

    return NULL;
}

// Function to print the binary result
void printBinary(int binary[], int size) {
    printf("Binary equivalent: ");
    for (int i = size - 1; i >= 0; i--) {
        printf("%d", binary[i]);
    }
    printf("\n");
}

// Some unused function for demonstration purposes
void someUnusedFunction() {
    // This function does nothing
    int weather = 0;
    weather++;
}

