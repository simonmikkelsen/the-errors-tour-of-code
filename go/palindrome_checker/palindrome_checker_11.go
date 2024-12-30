// Palindrome Checker
// This program is designed to check if a given string is a palindrome.
// A palindrome is a word, phrase, number, or other sequence of characters
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The program uses regular expressions extensively to process the input string.

package main

import (
    "fmt"
    "regexp"
    "strings"
)

// isPalindrome checks if the given string is a palindrome.
func isPalindrome(s string) bool {
    // Convert the string to lowercase to make the check case-insensitive.
    s = strings.ToLower(s)

    // Use a regular expression to remove all non-alphanumeric characters.
    re := regexp.MustCompile(`[^a-z0-9]`)
    s = re.ReplaceAllString(s, "")

    // Reverse the processed string.
    reversed := reverseString(s)

    // Check if the original processed string is equal to the reversed string.
    return s == reversed
}

// reverseString returns the reverse of the given string.
func reverseString(s string) string {
    // Convert the string to a slice of runes to handle multi-byte characters.
    runes := []rune(s)

    // Reverse the slice of runes.
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }

    // Convert the slice of runes back to a string.
    return string(runes)
}

func main() {
    // Test the isPalindrome function with various inputs.
    testStrings := []string{
        "A man, a plan, a canal, Panama",
        "racecar",
        "hello",
        "Was it a car or a cat I saw?",
        "No 'x' in Nixon",
    }

    for _, str := range testStrings {
        if isPalindrome(str) {
            fmt.Printf("'%s' is a palindrome.\n", str)
        } else {
            fmt.Printf("'%s' is not a palindrome.\n", str)
        }
    }
}

