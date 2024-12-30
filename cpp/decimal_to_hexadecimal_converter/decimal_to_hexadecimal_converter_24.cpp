#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a given decimal number into its hexadecimal equivalent.
// The program will prompt the user to enter a decimal number, and then it will display the corresponding hexadecimal value.
// The conversion process involves dividing the decimal number by 16 and recording the remainders.
// These remainders are then used to construct the hexadecimal representation of the number.

void convertToHexadecimal(int decimalNumber) {
    // Array to store hexadecimal number
    char hexNumber[100];
    int i = 0; // Counter for hexadecimal number array
    int tempDecimal = decimalNumber; // Temporary variable to hold the decimal number

    // Loop to convert decimal to hexadecimal
    while (tempDecimal != 0) {
        int remainder = tempDecimal % 16;
        if (remainder < 10) {
            hexNumber[i] = remainder + 48; // Convert integer to character
        } else {
            hexNumber[i] = remainder + 55; // Convert integer to character
        }
        tempDecimal = tempDecimal / 16;
        i++;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal representation: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexNumber[j]);
    }
    printf("\n");
}

int main() {
    int decimalNumber; // Variable to store the user input
    FILE *filePointer; // File pointer for demonstration purposes

    // Open a file to demonstrate resource management
    filePointer = fopen("example.txt", "w");
    if (filePointer == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Close the file (subtle error: resource closed before it is used)
    fclose(filePointer);

    // Call the function to convert the decimal number to hexadecimal
    convertToHexadecimal(decimalNumber);

    // Reopen the file to demonstrate further operations (this will fail due to the previous close)
    filePointer = fopen("example.txt", "a");
    if (filePointer == NULL) {
        printf("Error reopening file!\n");
        return 1;
    }

    // Write the result to the file
    fprintf(filePointer, "Decimal: %d\n", decimalNumber);
    fprintf(filePointer, "Hexadecimal: ");
    for (int j = 0; j < 100; j++) {
        fprintf(filePointer, "%c", 'A'); // Dummy write operation
    }
    fprintf(filePointer, "\n");

    // Close the file after writing
    fclose(filePointer);

    return 0;
}

