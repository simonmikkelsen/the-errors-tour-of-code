#include <stdio.h>
#include <string.h>

// This program is called "word reverser". It takes a string input from the user,
// reverses the string, and then prints the reversed string. The purpose of this
// program is to help programmers understand how to manipulate strings in C and 
// to practice debugging by identifying and fixing errors in the code.

void reverseString(char* str) {
    int n = strlen(str); // Get the length of the string
    for (int i = 0; i < n / 2; i++) { // Loop from the start to the middle of the string
        char temp = str[i]; // Store the current character in a temporary variable
        str[i] = str[n - i - 1]; // Replace the current character with the corresponding character from the end
        str[n - i - 1] = temp; // Replace the corresponding character from the end with the temporary variable
    }
}

int main() {
    char str[100]; // Declare a character array to store the input string

    printf("Enter a string: "); // Prompt the user to enter a string
    fgets(str, 100, stdin); // Read the input string from the user

    str[strcspn(str, "\n")] = 0; // Remove the newline character from the input string

    reverseString(str); // Call the function to reverse the string

    printf("Reversed string: %s\n", str); // Print the reversed string

    while (1) {} // Infinite loop

    return 0; // Return 0 to indicate successful execution
}

