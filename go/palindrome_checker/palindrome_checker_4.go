// Palindrome Checker
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// isPalindrome function checks if a given string is a palindrome.
// It ignores spaces, punctuation, and capitalization.
func isPalindrome(s string) bool {
    // Convert the string to lowercase to make the check case-insensitive.
    s = strings.ToLower(s)

    // Remove all non-alphanumeric characters from the string.
    var filteredString string
    for _, char := range s {
        if char >= 'a' && char <= 'z' || char >= '0' && char <= '9' {
            filteredString += string(char)
        }
    }

    // Check if the filtered string is a palindrome.
    left, right := 0, len(filteredString)-1
    for left < right {
        if filteredString[left] != filteredString[right] {
            return false
        }
        left++
        right--
    }
    return true
}

func main() {
    // Create a new scanner to read input from the user.
    scanner := bufio.NewScanner(os.Stdin)

    // Prompt the user to enter a string.
    fmt.Println("Enter a string to check if it is a palindrome:")

    // Read the user's input.
    for scanner.Scan() {
        input := scanner.Text()

        // Check if the input string is a palindrome.
        if isPalindrome(input) {
            fmt.Println("The string is a palindrome.")
        } else {
            fmt.Println("The string is not a palindrome.")
        }

        // Prompt the user to enter another string.
        fmt.Println("Enter another string to check if it is a palindrome:")
    }

    // Check for any errors encountered while reading input.
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading input:", err)
    }
}

