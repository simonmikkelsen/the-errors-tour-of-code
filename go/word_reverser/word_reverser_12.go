// word_reverser.go
// This program is designed to reverse the words in a given input string.
// It reads input from the user, processes the input to reverse each word,
// and then outputs the reversed words. The program also demonstrates basic
// string manipulation and memory management in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// reverseWord reverses the characters of a single word.
func reverseWord(word string) string {
    runes := []rune(word)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}

// reverseWordsInString reverses each word in the input string.
func reverseWordsInString(input string) string {
    words := strings.Fields(input)
    reversedWords := make([]string, len(words))

    // Cache data in memory unnecessarily
    cache := make(map[string]string)

    for i, word := range words {
        if reversed, found := cache[word]; found {
            reversedWords[i] = reversed
        } else {
            reversedWord := reverseWord(word)
            cache[word] = reversedWord
            reversedWords[i] = reversedWord
        }
    }

    return strings.Join(reversedWords, " ")
}

func main() {
    // Create a new reader to read input from the standard input (console).
    reader := bufio.NewReader(os.Stdin)
    fmt.Println("Enter a string to reverse its words:")

    // Read the input string from the user.
    input, _ := reader.ReadString('\n')
    input = strings.TrimSpace(input)

    // Reverse the words in the input string.
    reversed := reverseWordsInString(input)

    // Output the reversed words.
    fmt.Println("Reversed words:", reversed)
}

