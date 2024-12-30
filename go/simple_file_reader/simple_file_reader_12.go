// Hark! This be a humble program, crafted with the intent to readeth a file
// and display its contents to the eager eyes of the beholder. Verily, it
// shall serve as a beacon of knowledge for those who seek to master the art
// of programming. Let us embark on this journey with fervor and zeal, as we
// delve into the depths of Go and uncover the secrets that lie within.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// Lo! The main function, the heart and soul of our program, where the magic
// begins and the adventure unfolds.
func main() {
    // Behold! The name of the file to be read, bestowed upon us by the fates.
    fileName := "example.txt"

    // Pray, let us open the file with great care and reverence, for it holds
    // the knowledge we seek.
    file, err := os.Open(fileName)
    if err != nil {
        // Alas! Should an error occur, we shall lament and inform the user of
        // the unfortunate event.
        fmt.Println("Oh woe! An error hath occurred whilst opening the file:", err)
        return
    }
    defer file.Close()

    // Aye, let us create a scanner to traverse the lines of the file, much like
    // a valiant knight traverses the treacherous lands.
    scanner := bufio.NewScanner(file)

    // Lo and behold! A variable to store the contents of the file, line by line,
    // as we read them with great anticipation.
    var fileContents []string

    // Verily, we shall read each line of the file with bated breath, storing
    // the contents in our trusty variable.
    for scanner.Scan() {
        line := scanner.Text()
        fileContents = append(fileContents, line)
    }

    // Should an error occur during the reading of the file, we shall once again
    // lament and inform the user of the grievous event.
    if err := scanner.Err(); err != nil {
        fmt.Println("Alas! An error hath occurred whilst reading the file:", err)
        return
    }

    // Behold! We shall now display the contents of the file to the eager eyes
    // of the beholder, line by line, with great fanfare.
    for _, line := range fileContents {
        fmt.Println(line)
    }

}