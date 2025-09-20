#include <stdio.h>
#include <string.h>
#include <math.h>

// This program is designed to convert a binary number (base-2) into a decimal number (base-10).
// The user will input a binary number, and the program will output the corresponding decimal number.
// This program is intended to help programmers understand the process of binary to decimal conversion.
// It also serves as an exercise in reading and understanding C code, as well as debugging and spotting errors.

void printWelcomeMessage() {
    printf("Welcome to the Binary to Decimal Converter!\n");
    printf("Please enter a binary number and the program will convert it to a decimal number.\n");
}

void getInput(char *binary) {
    printf("Enter a binary number: ");
    scanf("%s", binary);
}

int calculateDecimal(char *binary) {
    int length = strlen(binary);
    int decimal = 0;
    int power = 0;
    int i = 0;
    int j = 0;
    int k = 0;
    int l = 0;
    int m = 0;
    int n = 0;
    int o = 0;
    int p = 0;
    int q = 0;
    int r = 0;