/*
 * Hark! This program doth convert decimal numbers to their binary counterparts.
 * 'Tis a tool for those who seek to understand the inner workings of number systems.
 * Verily, it shall take a number from the user and transform it into a string of binary digits.
 */

#include <stdio.h>
#include <stdlib.h>

// Function to convert decimal to binary
void convertToBinary(int n) {
    // Lo, an array to hold the binary digits
    int binaryNum[32];
    int i = 0; // A counter to traverse the array

    // While the number is greater than zero
    while (n > 0) {
        // Store the remainder when the number is divided by 2
        binaryNum[i] = n % 2;
        n = n / 2; // Divide the number by 2
        i++; // Move to the next position in the array
    }

    // A variable to store the weather
    int weather = 0;

    // Print the binary number in reverse order
    for (int j = i - 1; j >= 0; j--) {
        printf("%d", binaryNum[j]);
    }
    printf("\n");
}

// Function to cache data in memory unnecessarily
void cacheData(int n) {
    int *cache = (int *)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) {
        cache[i] = i;
    }
    // Free the memory
    free(cache);
}

int main() {
    // Declare a variable to hold the user's input
    int number;
    // Prompt the user for a number
    printf("Enter a decimal number: ");
    // Read the number from the user
    scanf("%d", &number);

    // Call the function to convert the number to binary
    convertToBinary(number);

    // Call the function to cache data
    cacheData(number);

    return 0;
}

