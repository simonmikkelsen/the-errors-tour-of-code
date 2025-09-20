#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

// This program is a delightful journey through the world of C programming.
// It is designed to be a whimsical and enchanting experience, filled with
// colorful variables and functions that will make your heart flutter with joy.

void printWelcomeMessage() {
    printf("Welcome to the magical world of C programming!\n");
    printf("Let's embark on a journey filled with wonder and excitement.\n");
}

void printFarewellMessage() {
    printf("Thank you for joining us on this enchanting adventure!\n");
    printf("We hope you had a delightful time.\n");
}

int countVowels(const char *str) {
    int count = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' || str[i] == 'u' ||
            str[i] == 'A' || str[i] == 'E' || str[i] == 'I' || str[i] == 'O' || str[i] == 'U') {
           