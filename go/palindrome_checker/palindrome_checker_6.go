// Palindrome Checker
// This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take a string input from the user and determine if it is a palindrome.
// It includes detailed comments to help programmers understand each part of the code.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// isPalindrome function checks if the given string is a palindrome.
func isPalindrome(s string) bool {
    // Convert the string to lowercase to make the check case-insensitive.
    s = strings.ToLower(s)
    // Remove all non-alphanumeric characters from the string.
    s = removeNonAlphanumeric(s)
    // Initialize two pointers, one at the beginning and one at the end of the string.
    left, right := 0, len(s)-1
    // Loop until the two pointers meet in the middle.
    for left < right {
        // If the characters at the two pointers are not the same, return false.
        if s[left] != s[right] {
            return false
        }
        // Move the pointers towards the middle.
        left++
        right--
    }
    // If all characters matched, return true.
    return true
}

// removeNonAlphanumeric function removes all non-alphanumeric characters from the string.
func removeNonAlphanumeric(s string) string {
    var result strings.Builder
    // Loop through each character in the string.
    for _, char := range s {
        // If the character is alphanumeric, add it to the result.
        if (char >= 'a' && char <= 'z') || (char >= '0' && char <= '9') {
            result.WriteRune(char)
        }
    }
    // Return the cleaned string.
    return result.String()
}

func main() {
    // Create a new reader to read input from the standard input (console).
    reader := bufio.NewReader(os.Stdin)
    fmt.Println("Enter a string to check if it is a palindrome:")
    // Read the input string from the user.
    input, _ := reader.ReadString('\n')
    // Trim any leading or trailing whitespace from the input string.
    input = strings.TrimSpace(input)
    // Check if the input string is a palindrome.
    if isPalindrome(input) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }
}

