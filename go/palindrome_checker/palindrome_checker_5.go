// palindrome_checker.go
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

    // Initialize two pointers, one at the beginning and one at the end of the string.
    left, right := 0, len(cleanedString)-1

    // Loop until the two pointers meet in the middle.
    for left < right {
        // Compare the characters at the two pointers.
        if cleanedString[left] != cleanedString[right] {
            // If the characters are not the same, the string is not a palindrome.
            return false
        }
        // Move the pointers closer to the middle.
        left++
        right--
    }

    // If all characters matched, the string is a palindrome.
    return true
}

func main() {
    // Prompt the user to enter a string.
    fmt.Println("Enter a string to check if it is a palindrome:")
    var input string
    fmt.Scanln(&input)

    // Call the isPalindrome function and print the result.
    if isPalindrome(input) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }
}

