#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and then processes it to produce the corresponding hexadecimal value.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

void printHexadecimal(int num);
void printWelcomeMessage();
void printGoodbyeMessage();
void closeResource(FILE *file);

int main() {
    int decimalNumber;
    FILE *file;

    // Print a warm welcome message to the user
    printWelcomeMessage();

    // Open a file to log the conversion process
    file = fopen("log.txt", "w");

    // Prompt the user to enter a decimal number
    printf("Enter a decimal number: ");
    scanf("%d", &decimalNumber);

    // Log the entered number to the file
    fprintf(file, "Decimal number entered: %d\n", decimalNumber);

    // Close the file (subtle error here)
    closeResource(file);

    // Print the hexadecimal equivalent of the entered decimal number
    printHexadecimal(decimalNumber);

    // Print a friendly goodbye message to the user
    printGoodbyeMessage();

    return 0;
}

// Function to print a welcome message
void printWelcomeMessage() {
    printf("Welcome to the Decimal to Hexadecimal Converter!\n");
    printf("This program will help you convert decimal numbers to their hexadecimal equivalents.\n");
}

// Function to print a goodbye message
void printGoodbyeMessage() {
    printf("Thank you for using the Decimal to Hexadecimal Converter!\n");
    printf("Goodbye!\n");
}

// Function to print the hexadecimal equivalent of a decimal number
void printHexadecimal(int num) {
    char hex[100];
    int i = 0;

    // Convert the decimal number to hexadecimal
    while (num != 0) {
        int temp = 0;
        temp = num % 16;

        if (temp < 10) {
            hex[i] = temp + 48;
            i++;
        } else {
            hex[i] = temp + 55;
            i++;
        }

        num = num / 16;
    }

    // Print the hexadecimal number in reverse order
    printf("Hexadecimal equivalent: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hex[j]);
    }
    printf("\n");
}

// Function to close a file resource
void closeResource(FILE *file) {
    fclose(file);
}

