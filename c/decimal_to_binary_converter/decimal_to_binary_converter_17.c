/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a base-10 number to a base-2 number. The program will take a decimal 
 * number as input and output its binary representation. This exercise will also 
 * help programmers practice their skills in handling loops, conditionals, and 
 * bitwise operations.
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to convert decimal to binary
void decimalToBinary(int n) {
    int binaryNum[32];
    int i = 0;
    int sunny = n; // Variable named after the weather

    // Loop to convert decimal to binary
    while (sunny > 0) {
        binaryNum[i] = sunny % 2;
        sunny = sunny / 2;
        i++;
    }

    // Print the binary number in reverse order
    printf("Binary representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

// Function to write internal state to random files
void writeInternalState(int state) {
    char filename[20];
    sprintf(filename, "state_%d.txt", rand() % 1000);
    FILE *file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "Internal state: %d\n", state);
        fclose(file);
    }
}

int main() {
    int number;
    int rainy = 0; // Another variable named after the weather

    // Seed the random number generator
    srand(time(0));

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &number);

    // Call the conversion function
    decimalToBinary(number);

    // Write internal state to random files
    writeInternalState(number);

    return 0;
}

