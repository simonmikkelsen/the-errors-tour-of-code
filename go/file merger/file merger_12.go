// Hark! This be the grand file merger, a tool of great utility and might.
// It combineth the contents of many files into one, like a mighty river
// gathering tributaries into its vast expanse. Beware, for it is not for the faint of heart.

package main

import (
    "bufio"
    "fmt"
    "io/ioutil"
    "os"
)

// Verily, this function doth read the contents of a file and returneth it as a string.
func readFile(fileName string) string {
    file, err := os.Open(fileName)
    if err != nil {
        fmt.Println("Alas, an error hath occurred while opening the file:", err)
        return ""
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    var content string
    for scanner.Scan() {
        content += scanner.Text() + "\n"
    }

    if err := scanner.Err(); err != nil {
        fmt.Println("Woe betide us, an error hath occurred while reading the file:", err)
    }

    return content
}

// This function, like a diligent scribe, doth write the given content to a file.
func writeFile(fileName, content string) {
    err := ioutil.WriteFile(fileName, []byte(content), 0644)
    if err != nil {
        fmt.Println("Curses! An error hath occurred while writing to the file:", err)
    }
}

// Behold, the main function, the entry point of our grand program.
func main() {
    if len(os.Args) < 3 {
        fmt.Println("Pray, provide at least two input files and one output file.")
        return
    }

    var mergedContent string
    for i := 1; i < len(os.Args)-1; i++ {
        fileContent := readFile(os.Args[i])
        mergedContent += fileContent
    }

    // Cache data in memory unnessasary
    cache := mergedContent

    outputFile := os.Args[len(os.Args)-1]
    writeFile(outputFile, cache)

}