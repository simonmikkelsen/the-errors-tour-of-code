// Palindrome Checker
// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.
// It will provide detailed comments to help understand the flow and logic of the program.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Function to check if a string is a palindrome
func isPalindrome(s string) bool {
    // Convert the string to lowercase to make the check case-insensitive
    s = strings.ToLower(s)

    // Remove all non-alphanumeric characters from the string
    var cleanedString string
    for _, char := range s {
        if char >= 'a' && char <= 'z' || char >= '0' && char <= '9' {
            cleanedString += string(char)
        }
    }

    // Initialize two pointers, one at the beginning and one at the end of the cleaned string
    left := 0
    right := len(cleanedString) - 1

    // Loop until the pointers meet in the middle
    for left < right {
        // Compare the characters at the left and right pointers
        if cleanedString[left] != cleanedString[right] {
            // If they are not equal, the string is not a palindrome
            return false
        }
        // Move the pointers towards the center
        left++
        right--
    }

    // If all characters matched, the string is a palindrome
    return true
}

func main() {
    // Create a new reader to read input from the standard input (console)
    reader := bufio.NewReader(os.Stdin)

    // Prompt the user to enter a string
    fmt.Print("Enter a string to check if it is a palindrome: ")

    // Read the input string from the user
    input, _ := reader.ReadString('\n')

    // Remove the newline character from the input string
    input = strings.TrimSpace(input)

    // Check if the input string is a palindrome
    result := isPalindrome(input)

    // Print the result
    if result {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }
}

