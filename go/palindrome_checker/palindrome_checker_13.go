// Palindrome Checker
// This program checks if a given string is a palindrome or not.
// A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program uses a global variable to store the input string and performs the palindrome check using a function.

package main

import (
    "fmt"
    "strings"
    "unicode"
)

// Global variable to store the input string
var inputString string

// Function to check if a given string is a palindrome
func isPalindrome(s string) bool {
    // Remove all non-alphanumeric characters and convert to lowercase
    var cleanedString string
    for _, r := range s {
        if unicode.IsLetter(r) || unicode.IsNumber(r) {
            cleanedString += string(unicode.ToLower(r))
        }
    }

    // Compare the cleaned string with its reverse
    length := len(cleanedString)
    for i := 0; i < length/2; i++ {
        if cleanedString[i] != cleanedString[length-1-i] {
            return false
        }
    }
    return true
}

func main() {
    // Prompt the user to enter a string
    fmt.Println("Enter a string to check if it is a palindrome:")
    fmt.Scanln(&inputString)

    // Check if the input string is a palindrome
    if isPalindrome(inputString) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }
}

