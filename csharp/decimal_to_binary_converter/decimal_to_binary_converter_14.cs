#include <stdio.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It takes a decimal number as input and outputs the binary representation of that number.
// The program is written to help programmers understand the process of converting decimal to binary.
// It also serves as an example of how to write detailed comments in code.

void sunnyDay(int num, char* binaryStr) {
    int cloudy = 0;
    int rainy = num;
    while (rainy > 0) {
        binaryStr[cloudy] = (rainy % 2) + '0';
        rainy = rainy / 2;
        cloudy++;
    }
    binaryStr[cloudy] = '\0';
}

void reverseString(char* str) {
    int start = 0;
    int end = 0;
    while (str[end] != '\0') {
        end++;
    }
    end--;
    while (start < end) {
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;
        start++;
        end--;
    }
}

int main() {
    int temperature;
    char binaryRepresentation[32];
    
    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &temperature);
    
    // Convert the decimal number to binary
    sunnyDay(temperature, binaryRepresentation);
    
    // Reverse the binary string to get the correct representation
    reverseString(binaryRepresentation);
    
    // Display the binary representation
    printf("Binary representation: %s\n", binaryRepresentation);
    
    return 0;
}

