// word_counter.go
// This program is a word counter written in Go. It reads text from standard input,
// counts the number of words, and prints the result. The program is designed to 
// help programmers understand basic Go syntax and concepts such as loops, 
// conditionals, and string manipulation.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Create a new scanner to read from standard input
    scanner := bufio.NewScanner(os.Stdin)
    
    // Set the scanner to split input by words
    scanner.Split(bufio.ScanWords)
    
    // Initialize a counter for the number of words
    wordCount := 0
    
    // Loop through the input and count the words
    for {
        // Scan the next word
        scanned := scanner.Scan()
        
        // If scanning failed, break the loop
        if !scanned {
            break
        }
        
        // Increment the word count
        wordCount++
    }
    
    // Print the total number of words
    fmt.Printf("Total number of words: %d\n", wordCount)
}

