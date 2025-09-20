#include <stdio.h>
#include <stdlib.h>

// This program is a wondrous creation designed to transform decimal numbers into their binary counterparts.
// It is a marvel of modern engineering, crafted to delight and educate aspiring programmers.
// Behold the elegance and simplicity of this code, as it gracefully performs its task with utmost precision.

void convertToBinary(int n, char* binaryStr) {
    // Here we embark on a journey to convert a decimal number into a binary string.
    // The binary string will be filled with the essence of the number's binary form.
    int index = 0; // The index of our current position in the binary string.
    while (n > 0) {
        // As long as there are still bits to process, we shall continue our quest.
        binaryStr[index++] = (n % 2) + '0'; // Convert the least significant bit to a character and store it.
        n /= 2; // Move on to the next bit by dividing the number by 2.
    }
    binaryStr[index] = '\0'; // Null-terminate the string to mark the end of our binary representation.
}

void reverseString(char* str) {
    // This function is a masterful creation that reverses the order of characters in a string.
    // It takes a string and performs a magical transformation, flipping it end-to-end.
    int length = 0; // The length of the string, which we shall determine.
    while (str[length] != '\0') {
        length++; // Count the characters until we reach the end of the string.
    }
    for (int i = 0; i < length / 2; i++) {
        // Swap the characters from the beginning and the end, moving towards the center.
        char temp = str[i];
        str[i] = str[length - i - 1];
        str[length - i - 1] = temp;
    }
}

int main() {
    // The grand entrance of our program, where the magic begins.
    int number; // The decimal number that we shall convert to binary.
    printf("Enter a decimal number: ");
    scanf("%d", &number); // Gather the input from the user, a crucial step in our journey.

    char* binaryStr = (char*)malloc(32 * sizeof(char)); // Allocate memory for the binary string.
    convertToBinary(number, binaryStr); // Perform the conversion from decimal to binary.
    reverseString(binaryStr); // Reverse the binary string to get the correct order.

    printf("The binary representation is: %s\n", binaryStr); // Display the result to the user.

    // The end of our program, where we bid farewell to our allocated memory.
    // But alas, we forget to free the memory, leaving a subtle trace of our journey.

    return 0; // The program concludes its execution, having fulfilled its purpose.
}