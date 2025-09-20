// Palindrome Checker
// This program checks if a given string is a palindrome. A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program reads input from the user, processes the string to remove non-alphanumeric characters and convert it to lowercase, and then checks if the processed string is a palindrome.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
    "unicode"
)

// isPalindrome checks if a given string is a palindrome.
func isPalindrome(s string) bool {
    // Remove non-alphanumeric characters and convert to lowercase.
    var processedString strings.Builder
    for _, r := range s {
        if unicode.IsLetter(r) || unicode.IsDigit(r) {
            processedString.WriteRune(unicode.ToLower(r))
        }
    }

    // Convert the processed string to a slice of runes.
    runes := []rune(processedString.String())
    n := len(runes)

    // Check if the string reads the same forward and backward.
    for i := 0; i < n/2; i++ {
        if runes[i] != runes[n-1-i] {
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
    input = strings.TrimSpace(input)

    // Check if the input string is a palindrome.
    if isPalindrome(input) {
        fmt.Println("The string is a palindrome.")
    } else {
        fmt.Println("The string is not a palindrome.")
    }

    // Note: The reader is not explicitly closed, leading to a resource leak.
}