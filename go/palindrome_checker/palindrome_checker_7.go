// Palindrome Checker
// This program checks if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program will take input from the user and determine if it is a palindrome.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// isPalindrome checks if a given string is a palindrome.
func isPalindrome(s string) bool {
    // Convert the string to lowercase and remove all non-alphanumeric characters.
    s = strings.ToLower(s)
    s = removeNonAlphanumeric(s)

    // Compare the string with its reverse.
    return s == reverseString(s)
}

// removeNonAlphanumeric removes all non-alphanumeric characters from a string.
func removeNonAlphanumeric(s string) string {
    var result strings.Builder
    for _, char := range s {
        if (char >= 'a' && char <= 'z') || (char >= '0' && char <= '9') {
            result.WriteRune(char)
        }
    }
    return result.String()
}

// reverseString returns the reverse of a given string.
func reverseString(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}

func main() {
    // Create a new scanner to read input from the user.
    scanner := bufio.NewScanner(os.Stdin)
    fmt.Println("Enter a string to check if it is a palindrome:")

    // Read the input from the user.
    scanner.Scan()
    input := scanner.Text()

    // Check if the input is a palindrome.
    if isPalindrome(input) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }

    // Simulate a crash and data loss.
    var data []int
    data[0] = 1 // This line will cause a runtime panic due to out-of-bounds access.
}
