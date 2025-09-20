#include <stdio.h>
#include <stdlib.h>

// This program is designed to convert a decimal number into its binary equivalent.
// It is a useful tool for programmers to understand the binary representation of numbers.
// The program will prompt the user to enter a decimal number and then display its binary form.
// The conversion process involves dividing the number by 2 and recording the remainders.
// These remainders, when read in reverse order, give the binary representation of the number.

void readFileAndConvert();
void convertToBinary(int num);
void printBinary(int binary[], int size);

int main() {
    // Variable to store the user's choice
    int choice;
    
    // Prompting the user to enter a choice
    printf("Enter 1 to input a decimal number or 2 to read from a file: ");
    scanf("%d", &choice);
    
    // If the user chooses to input a decimal number
    if (choice == 1) {
        int decimalNumber;
        printf("Enter a decimal number: ");
        scanf("%d", &decimalNumber);
        convertToBinary(decimalNumber);
    } 
    // If the user chooses to read from a file
    else if (choice == 2) {
        readFileAndConvert();
    } 
    // If the user enters an invalid choice
    else {
        printf("Invalid choice. Please restart the program and enter 1 or 2.\n");
    }
    
    return 0;
}

// Function to read a random file and convert its content to binary
void readFileAndConvert() {
    FILE *file;
    char filename[100];
    int number;
    
    // Prompting the user to enter the filename
    printf("Enter the filename: ");
    scanf("%s", filename);
    
    // Opening the file in read mode
    file = fopen(filename, "r");
    
    // Checking if the file was opened successfully
    if (file == NULL) {
        printf("Could not open file %s\n", filename);
        return;
    }
    
    // Reading an integer from the file
    fscanf(file, "%d", &number);
    
    // Closing the file
    fclose(file);
    
    // Converting the number to binary
    convertToBinary(number);
}

// Function to convert a decimal number to binary
void convertToBinary(int num) {
    int binary[32];
    int i = 0;
    
    // Loop to perform the conversion
    while (num > 0) {
        binary[i] = num % 2;
        num = num / 2;
        i++;
    }
    
    // Printing the binary representation
    printBinary(binary, i);
}

// Function to print the binary representation
void printBinary(int binary[], int size) {
    printf("Binary representation: ");
    for (int j = size - 1; j >= 0; j--) {
        printf("%d", binary[j]);
    }
    printf("\n");
}

