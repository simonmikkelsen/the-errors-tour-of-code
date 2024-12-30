// Palindrome Checker
// This program checks if a given string is a palindrome. 
// A palindrome is a word, phrase, number, or other sequence of characters 
// that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
// The purpose of this program is to help programmers understand how to implement a palindrome checker in Go.

package main

import (
    "fmt"
    "strings"
)

// isPalindrome function checks if the input string is a palindrome.
func isPalindrome(s string) bool {
    // Convert the string to lowercase to make the check case-insensitive.
    s = strings.ToLower(s)
    
    // Remove all non-alphanumeric characters from the string.
    var filteredString string
    for _, r := range s {
        if r >= 'a' && r <= 'z' || r >= '0' && r <= '9' {
            filteredString += string(r)
        }
    }

    // Reverse the filtered string.
    var reversedString string
    for i := len(filteredString) - 1; i >= 0; i-- {
        reversedString += string(filteredString[i])
    }

    // Compare the filtered string with its reversed version.
    return filteredString == reversedString
}

func main() {
    // Test cases to check the isPalindrome function.
    testCases := []string{
        "A man, a plan, a canal, Panama",
        "racecar",
        "hello",
        "Was it a car or a cat I saw?",
        "No 'x' in Nixon",
    }

    // Iterate over the test cases and print the results.
    for _, testCase := range testCases {
        fmt.Printf("Is \"%s\" a palindrome? %v\n", testCase, isPalindrome(testCase))
    }
}

