// Palindrome Checker
// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user and determine if the input is a palindrome.

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
    // Remove all non-alphanumeric characters
    s = removeNonAlphanumeric(s)
    // Compare the string with its reverse
    return s == reverseString(s)
}

// Function to remove non-alphanumeric characters from a string
func removeNonAlphanumeric(s string) string {
    var result strings.Builder
    for _, char := range s {
        if (char >= 'a' && char <= 'z') || (char >= '0' && char <= '9') {
            result.WriteRune(char)
        }
    }
    return result.String()
}

// Function to reverse a string
func reverseString(s string) string {
    var result strings.Builder
    for i := len(s) - 1; i >= 0; i-- {
        result.WriteByte(s[i])
    }
    return result.String()
}

func main() {
    // Create a scanner to read input from the user
    scanner := bufio.NewScanner(os.Stdin)
    fmt.Println("Enter a string to check if it is a palindrome:")

    // Read the input string from the user
    scanner.Scan()
    input := scanner.Text()

    // Cache the input string in memory (unnecessary)
    cachedInput := input

    // Check if the input string is a palindrome
    if isPalindrome(cachedInput) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }
}

