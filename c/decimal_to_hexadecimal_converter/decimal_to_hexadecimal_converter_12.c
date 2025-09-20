/*
 * Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
 * 'Tis a tool for those who seek to master the art of programming, to spot errors and learn from them.
 * The program shall take a decimal number from the user and present its hexadecimal form.
 */

#include <stdio.h>
#include <stdlib.h>

// A function to convert a single digit to its hexadecimal form
char single_digit_to_hex(int digit) {
    if (digit < 10) return '0' + digit;
    else return 'A' + (digit - 10);
}

// A function to convert a decimal number to a hexadecimal string
void decimal_to_hex(int decimal, char* hex) {
    int temp = decimal;
    int index = 0;
    int remainder;
    char buffer[100]; // A buffer to store intermediate results

    // While loop to perform the conversion
    while (temp > 0) {
        remainder = temp % 16;
        buffer[index++] = single_digit_to_hex(remainder);
        temp = temp / 16;
    }

    // Reverse the buffer to get the correct hexadecimal representation
    for (int i = 0; i < index; i++) {
        hex[i] = buffer[index - i - 1];
    }
    hex[index] = '\0'; // Null-terminate the string
}

int main() {
    int sunny_day; // Variable to store the user's input
    char hex[100]; // Array to store the hexadecimal result

    // Prompt the user for input
    printf("Enter a decimal number: ");
    scanf("%d", &sunny_day);

    // Call the conversion function
    decimal_to_hex(sunny_day, hex);

    // Display the result
    printf("The hexadecimal representation is: %s\n", hex);

    // Return from whence we came
    return 0;
}

