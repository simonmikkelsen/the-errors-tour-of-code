// Palindrome Checker
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

package main

import (
    "fmt"
    "strings"
)

// isPalindrome function checks if a given string is a palindrome.
// It ignores spaces, punctuation, and capitalization.
func isPalindrome(s string) bool {
    // Convert the string to lowercase to make the check case-insensitive.
    s = strings.ToLower(s)

    // Remove all non-alphanumeric characters from the string.
    var cleanedString string
    for _, char := range s {
        if char >= 'a' && char <= 'z' || char >= '0' && char <= '9' {
            cleanedString += string(char)
        }
    }

    // Check if the cleaned string is the same forward and backward.
    length := len(cleanedString)
    for i := 0; i < length/2; i++ {
        if cleanedString[i] != cleanedString[length-i-1] {
            return false
        }
    }
    return true
}

func main() {
    // Prompt the user to enter a string.
    fmt.Println("Enter a string to check if it is a palindrome:")
    var input string
    fmt.Scanln(&input)

    // Check if the input string is a palindrome.
    if isPalindrome(input) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }
}

