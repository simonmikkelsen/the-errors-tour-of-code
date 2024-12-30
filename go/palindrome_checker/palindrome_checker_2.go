// Palindrome Checker
// This program checks if a given string is a palindrome.
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

// isPalindrome function checks if the given string is a palindrome.
// It ignores spaces, punctuation, and capitalization.
func isPalindrome(s string) bool {
    // Convert the string to lowercase to ignore capitalization.
    s = strings.ToLower(s)

    // Remove all non-alphanumeric characters from the string.
    var filteredString string
    for _, char := range s {
        if char >= 'a' && char <= 'z' || char >= '0' && char <= '9' {
            filteredString += string(char)
        }
    }

    // Check if the filtered string is the same forward and backward.
    length := len(filteredString)
    for i := 0; i < length/2; i++ {
        if filteredString[i] != filteredString[length-1-i] {
            return false
        }
    }
    return true
}

func main() {
    // Create a new reader to read input from the user.
    reader := bufio.NewReader(os.Stdin)
    fmt.Println("Enter a string to check if it is a palindrome:")

    // Read the input string from the user.
    input, _ := reader.ReadString('\n')

    // Check if the input string is a palindrome.
    if isPalindrome(input) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }

    // Memory leak: The reader is not closed.
}