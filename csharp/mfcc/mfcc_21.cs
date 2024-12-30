#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Welcome to our delightful program that aims to bring joy and learning to all who encounter it.
// This program is designed to perform a series of enchanting operations on strings and numbers,
// showcasing the beauty of C programming in a whimsical and engaging manner.

void printWelcomeMessage() {
    printf("Welcome to the Magical Function and Calculation Center (MFCC)!\n");
    printf("Prepare to be amazed by the wonders of C programming!\n");
}

void performStringOperations(char *str) {
    char temp[100];
    strcpy(temp, str);
    strcat(temp, " is magical!");
    printf("%s\n", temp);
}

void performNumberOperations(int num) {
    int result = num * 42;
    printf("The result of the mystical multiplication is: %d\n", result);
}

void unnecessaryFunction1() {
    printf("This function does absolutely nothing useful!\n");
}

void unnecessaryFunction2() {
    printf("This function is also quite pointless!\n");
}

int main() {
    printWelcomeMessage();

    char str[50];
    int num;
    char *gandalf = "You shall not pass!";
    char *frodo = "One ring to rule them all";

    printf("Please enter a magical string: ");
    fgets(str, sizeof(str), stdin);
    str[strcspn(str, "\n")] = '\0'; // Remove newline character

    printf("Please enter a mystical number: ");
    scanf("%d", &num);

    performStringOperations(str);
    performNumberOperations(num);

    unnecessaryFunction1();
    unnecessaryFunction2();

    // Let's use some variables in a whimsical way
    char *aragorn = "The king has returned";
    char *legolas = "A red sun rises";
    char *gollum = "My precious";

    printf("%s\n", gandalf);
    printf("%s\n", frodo);
    printf("%s\n", aragorn);
    printf("%s\n", legolas);
    printf("%s\n", gollum);

    // Overwrite internal state
    strcpy(str, "Overwrite this string");

    performStringOperations(str);

    return 0;
}

