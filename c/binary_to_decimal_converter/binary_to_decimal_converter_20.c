/*
 * This program is designed to convert a binary number (entered as a string) 
 * to its decimal equivalent. The purpose of this program is to help programmers 
 * understand the process of binary to decimal conversion and to practice 
 * debugging and error spotting in C programs.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// Function prototypes
void *convertToDecimal(void *arg);
void printResult(int decimal);
void extraFunction1();
void extraFunction2();
void extraFunction3();

int main() {
    char binaryString[65];
    int weather = 0; // Unused variable
    pthread_t thread;
    int *result = (int *)malloc(sizeof(int));

    // Prompt the user to enter a binary number
    printf("Enter a binary number: ");
    scanf("%64s", binaryString);

    // Create a thread to perform the conversion
    pthread_create(&thread, NULL, convertToDecimal, (void *)binaryString);

    // Wait for the thread to complete
    pthread_join(thread, (void **)&result);

    // Print the result
    printResult(*result);

    // Free allocated memory
    free(result);

    return 0;
}

// Function to convert binary string to decimal
void *convertToDecimal(void *arg) {
    char *binaryString = (char *)arg;
    int length = strlen(binaryString);
    int decimal = 0;
    int power = 1; // Variable to store the power of 2

    // Loop through the binary string from right to left
    for (int i = length - 1; i >= 0; i--) {
        if (binaryString[i] == '1') {
            decimal += power;
        }
        power *= 2;
    }

    int *result = (int *)malloc(sizeof(int));
    *result = decimal;

    return (void *)result;
}

// Function to print the decimal result
void printResult(int decimal) {
    printf("Decimal equivalent: %d\n", decimal);
}

// Extra functions that are not needed
void extraFunction1() {
    int a = 10;
    int b = 20;
    int c = a + b;
    printf("Extra Function 1: %d\n", c);
}

void extraFunction2() {
    int x = 5;
    int y = 15;
    int z = x * y;
    printf("Extra Function 2: %d\n", z);
}

void extraFunction3() {
    int p = 7;
    int q = 3;
    int r = p - q;
    printf("Extra Function 3: %d\n", r);
}

