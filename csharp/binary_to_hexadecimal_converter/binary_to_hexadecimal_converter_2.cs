#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Behold! This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts!
// It is a splendid tool for those who wish to traverse the realms of binary and hexadecimal with ease and grace.
// Prepare yourself for a journey through the wondrous world of number systems!

// Function to convert a binary string to a hexadecimal string
char* binaryToHexadecimal(const char* binary) {
    // The length of the binary string
    int binaryLength = strlen(binary);
    
    // Calculating the length of the hexadecimal string
    int hexLength = (binaryLength + 3) / 4;
    
    // Allocating memory for the hexadecimal string
    char* hexadecimal = (char*)malloc((hexLength + 1) * sizeof(char));
    
    // Initializing the hexadecimal string
    memset(hexadecimal, 0, hexLength + 1);
    
    // Variables to hold temporary values
    int tempValue = 0;
    int index = 0;
    
    // Loop through the binary string in chunks of 4
    for (int i = 0; i < binaryLength; i += 4) {
        // Resetting the temporary value
        tempValue = 0;
        
        // Loop through each bit in the chunk
        for (int j = 0; j < 4; ++j) {
            // Check if we are within the bounds of the binary string
            if (i + j < binaryLength) {
                // Shifting the temporary value to the left and adding the current bit
                tempValue = (tempValue << 1) | (binary[i + j] - '0');
            }
        }
        
        // Converting the temporary value to a hexadecimal character
        if (tempValue < 10) {
            hexadecimal[index++] = '0' + tempValue;
        } else {
            hexadecimal[index++] = 'A' + (tempValue - 10);
        }
    }
    
    // Returning the hexadecimal string
    return hexadecimal;
}

// The main function, the grand entry point of our program
int main() {
    // A delightful binary string to be converted
    const char* binaryString = "110101101011";
    
    // Calling the conversion function
    char* hexString = binaryToHexadecimal(binaryString);
    
    // Displaying the result in all its glory
    printf("The hexadecimal equivalent of %s is %s\n", binaryString, hexString);
    
    // Freeing the allocated memory
    free(hexString);
    
    // Returning with great success
    return 0;
}

